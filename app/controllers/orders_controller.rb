class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.includes(order_items: :product).find(params[:id])
    @supplier = @order.supplier
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.order_items.build
    @products = Product.all
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!
    redirect_to orders_path, status: :see_other, notice: "Order was successfully destroyed."
  end

  def update_status
    @purchase_order.update(status: params[:status])
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    # def order_params
    #   params.expect(order: [ :order_date, :order_number, :notes, :status, :payment_term_id, :supplier_id ])
    # end

    def order_params
      params.require(:order).permit(
        :delivery_date, :status, :order_date, :notes, :supplier_id, :payment_term_id,
        order_items_attributes: [ :id, :product_id, :quantity, :price, :total_amount, :_destroy ]
      )
    end
end
