class ActConsOrdsController < ApplicationController
  before_action :set_act_cons_ord, only: [:show, :update, :destroy]

  # GET /act_cons_ords
  def index
    @act_cons_ords = ActConsOrd.all

    render json: @act_cons_ords
  end

  # GET /act_cons_ords/1
  def show
    render json: @act_cons_ord
  end

  # POST /act_cons_ords
  def create
    @act_cons_ord = ActConsOrd.new(act_cons_ord_params)

    if @act_cons_ord.save
      render json: @act_cons_ord, status: :created, location: @act_cons_ord
    else
      render json: @act_cons_ord.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /act_cons_ords/1
  def update
    if @act_cons_ord.update(act_cons_ord_params)
      render json: @act_cons_ord
    else
      render json: @act_cons_ord.errors, status: :unprocessable_entity
    end
  end

  # DELETE /act_cons_ords/1
  def destroy
    @act_cons_ord.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act_cons_ord
      @act_cons_ord = ActConsOrd.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def act_cons_ord_params
      params.require(:act_cons_ord).permit(:code, :desc, :imp_anual_lic, :imp_anual_adj, :baja, :fecha_ini_contrato, :fecha_fin_contrato, :clave_proy, :num_ia, :fecha_ia, :n_pedido, :n_contrato)
    end
end
