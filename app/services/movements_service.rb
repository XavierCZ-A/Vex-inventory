class MovementsService
  attr_reader :order_item, :warehouse, :errors

  # Necesitas saber qué OrderItem se despacha y desde qué Warehouse
  def initialize(order_item:, warehouse:)
    @order_item = order_item
    @warehouse = warehouse
    @product = order_item.product
    @quantity_to_dispatch = order_item.quantity # Asumiendo que OrderItem tiene quantity
    @errors = []
  end

  def call
    # ¡Siempre usa transacciones para operaciones de inventario!
    ActiveRecord::Base.transaction do
      # 1. Buscar el registro de stock específico
      stock = Stock.lock.find_by(product: @product, warehouse: @warehouse) # .lock para evitar race conditions

      # 2. Validar si hay stock suficiente
      unless stock && stock.quantity >= @quantity_to_dispatch
        @errors << "Stock insuficiente para SKU #{@product.sku} en almacén #{@warehouse.name}."
        raise ActiveRecord::Rollback # Detiene la transacción y revierte cambios
      end

      # 3. Actualizar la cantidad en Stock
      new_quantity = stock.quantity - @quantity_to_dispatch
      unless stock.update(quantity: new_quantity)
        @errors.concat(stock.errors.full_messages)
        raise ActiveRecord::Rollback
      end

      # 4. Crear el Movimiento de Stock (StockMovement)
      movement = StockMovement.new(
        product: @product,
        warehouse: @warehouse,
        quantity: -@quantity_to_dispatch, # ¡NEGATIVO para salidas!
        movement_type: "sale",
        reference: @order_item, # Enlaza al OrderItem que causó el movimiento
        organization: @product.organization # Asigna la organización si aplica
      )
      unless movement.save
        @errors.concat(movement.errors.full_messages)
        raise ActiveRecord::Rollback
      end

      # 5. (Opcional) Actualizar estado del OrderItem, etc.
      # unless @order_item.update(status: 'dispatched')
      #   @errors.concat(@order_item.errors.full_messages)
      #  raise ActiveRecord::Rollback
      # end
    end # Fin de la transacción

    @errors.empty? # Retorna true si fue exitoso, false si hubo errores
  rescue StandardError => e
    # Captura otros errores inesperados si es necesario
    @errors << "Error inesperado: #{e.message}"
    false
  end

  # Método de conveniencia para llamar al servicio
  def self.call(*args)
    new(*args).call
  end
end
