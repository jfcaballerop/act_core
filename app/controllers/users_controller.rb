class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    # binding.pry
    # byebug
    @users = User.all
    @ret = []

    @users.map do |u|
      # binding.pry
      u["roles_val"] = []
      u["roles_val"] = u.roles.only :code
      @ret << u
    end

    render json: @ret
  end

  # GET /users/1
  def show
    @json = {
      id: @user._id,
      name: @user.name,
      login: @user.login,
      roles: @user.roles
    }
    render json: @json
  end

  # POST /users
  def create
    @user = User.new(user_params)

    # binding.pry
    @user.roles << Role.where(code: {'$in': get_roles})
    ## Tener en cuenta para el Front, si el role va vacío no se puede loguear en al aplicacion

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :login, :password, :password_digest, :roles)
    end

    def get_roles
      params[:user][:roles]
    end
end
