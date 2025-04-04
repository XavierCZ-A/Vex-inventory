class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]

  # GET /stocks or /stocks.json
  def index
    if params[:id]
      @warehouse = Warehouse.find(params[:id])
      @stocks = @warehouse.stocks.includes(product: :category)
    else
      @stocks = Stock.includes(product: :category)
    end
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks or /stocks.json
  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to products_path, notice: "Stock was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: "Stock was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy!
    redirect_to stocks_path, status: :see_other, notice: "Stock was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.expect(stock: [ :product_id, :warehouse_id, :quantity, :entry_date ])
    end
end
