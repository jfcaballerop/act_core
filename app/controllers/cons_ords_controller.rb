class ConsOrdsController < ApplicationController
  before_action :set_cons_ord, only: [:show, :update, :destroy]

  # GET /cons_ords
  def index
    @cons_ords = ConsOrd.all

    render json: @cons_ords
  end

  # GET /cons_ords/1
  def show
    render json: @cons_ord
  end

  # POST /cons_ords
  def create
    @cons_ord = ConsOrd.new(cons_ord_params)

    if @cons_ord.save
      render json: @cons_ord, status: :created, location: @cons_ord
    else
      render json: @cons_ord.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cons_ords/1
  def update
    if @cons_ord.update(cons_ord_params)
      render json: @cons_ord
    else
      render json: @cons_ord.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cons_ords/1
  def destroy
    @cons_ord.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cons_ord
      @cons_ord = ConsOrd.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cons_ord_params
      params.require(:cons_ord).permit(:nombre, :codigo, :descr)
    end
end
