class RoutineProductsController < ApplicationController
  before_action :set_routine_product, only: %i[ show edit update destroy ]

  # GET /routine_products or /routine_products.json
  def index
    @routine_products = RoutineProduct.all
  end

  # GET /routine_products/1 or /routine_products/1.json
  def show
  end

  # GET /routine_products/new
  def new
    @routine_product = RoutineProduct.new
  end

  # GET /routine_products/1/edit
  def edit
  end

  # POST /routine_products or /routine_products.json
  def create
    @routine_product = RoutineProduct.new(routine_product_params)

    respond_to do |format|
      if @routine_product.save
        format.html { redirect_to routine_product_url(@routine_product), notice: "Routine product was successfully created." }
        format.json { render :show, status: :created, location: @routine_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @routine_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routine_products/1 or /routine_products/1.json
  def update
    respond_to do |format|
      if @routine_product.update(routine_product_params)
        format.html { redirect_to routine_product_url(@routine_product), notice: "Routine product was successfully updated." }
        format.json { render :show, status: :ok, location: @routine_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @routine_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routine_products/1 or /routine_products/1.json
  def destroy
    @routine_product.destroy

    respond_to do |format|
      format.html { redirect_to routine_products_url, notice: "Routine product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_routine_product
      @routine_product = RoutineProduct.find(params[:id])
    end

    def routine_product_params
      params.require(:routine_product).permit(:routine_id, :product_id)
    end
end
