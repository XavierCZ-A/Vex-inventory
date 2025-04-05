class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @pagy, @products = pagy(Product.includes(:category).order(created_at: :desc))
    @total_products_price = Product.total_products_price
    @total_stock = Stock.total_stock
    respond_to do |format|
      format.html
      format.csv { send_data Product.to_csv, filename: "products-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv" }
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.stocks.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product was successfully created."
      # redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!
    redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :description, :price, :category_id ])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id,
      stocks_attributes: [ :id, :warehouse_id, :quantity, :_destroy ])
    end
end
