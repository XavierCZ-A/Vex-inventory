class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[ show edit update destroy ]

  # GET /order_items or /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1 or /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items or /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      redirect_to @order_item, notice: "Order item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_items/1 or /order_items/1.json
  def update
    if @order_item.update(order_item_params)
      redirect_to @order_item, notice: "Order item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/1 or /order_items/1.json
  def destroy
    @order_item.destroy!
    redirect_to order_items_path, status: :see_other, notice: "Order item was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.expect(order_item: [ :quantity, :price, :total_amount, :order_id, :product_id ])
    end
end
