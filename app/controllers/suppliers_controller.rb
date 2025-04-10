class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]

  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.all.order(created_at: :desc)
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to suppliers_path, notice: "Supplier was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: "Supplier was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy!
    redirect_to suppliers_path, status: :see_other, notice: "Supplier was successfully destroyed."
  end

  def purchase_orders
    @supplier = Supplier.find(params[:id])
    @orders = Order.where(supplier_id: @supplier.id)
    @total_amount = @orders.total_amount_order
    respond_to do |format|
      format.html do
        render partial: "suppliers/components/supplier_purchase_orders", locals: { supplier: @supplier, orders: @orders, total_amount: @total_amount }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.expect(supplier: [ :company_name, :supplier_name, :supplier_phone, :supplier_email, :supplier_address, :notes ])
    end
end
