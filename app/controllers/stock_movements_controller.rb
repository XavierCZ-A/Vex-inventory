class StockMovementsController < ApplicationController
  # GET /stock_movements or /stock_movements.json
  def index
    @stock_movements = StockMovement.includes(:product, :warehouse, :user).order(created_at: :desc)
  end

  # GET /stock_movements/new
  def new
    @stock_movement = StockMovement.new
  end

  # POST /stock_movements or /stock_movements.json
  def create
    @stock_movement = StockMovement.new(stock_movement_params)
    if @stock_movement.save
      redirect_to stock_movements_path, notice: "Stock movement was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def stock_movement_params
      params.expect(stock_movement: [ :product_id, :warehouse_id, :quantity_change, :movement_date, :notes, :user_id, :movement_type, :organization_id ])
    end
end
