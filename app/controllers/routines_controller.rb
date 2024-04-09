class RoutinesController < ApplicationController
  before_action :set_routine, only: %i[ show edit update destroy ]
  before_action :set_products, only: [:new]

  # GET /routines or /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1 or /routines/1.json
  def show
  end

  # GET /routines/new
  def new
    @routine = Routine.new
    @products = Product.all
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines or /routines.json
  def create
    @routine = current_user.routines.build(routine_params)
    if @routine.save
      params[:product_ids].reject(&:blank?).each do |product_id|
        @routine.routine_products.create(product_id: product_id)
      end
      redirect_to routines_path, notice: 
    else
      @products = Product.all
      render :new, status: :unprocessable_entity
    end
  end
  
  

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully updated." }
        format.json { render :show, status: :ok, location: @routine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1 or /routines/1.json
  def destroy
    @routine.destroy

    respond_to do |format|
      format.html { redirect_to routines_url, notice: "Routine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_products
      @products = Product.all
    end

    def save_selected_products_to_routine(product_ids)
      product_ids.each do |product_id|
        @routine.routine_products.create(product_id: product_id)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routine_params
      params.require(:routine).permit(:name, :user_id)
    end
end
