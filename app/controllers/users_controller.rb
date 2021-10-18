class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_user, only: [:update, :destroy]
  before_action :require_super_user_or_user_himself, only: [:update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user_and_api_key = User.create_with_api_key(**user_params)
    @user = @user_and_api_key[:user]

    if @user.valid?
      render json: @user_and_api_key, status: :created, location: @user
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

    # Only allow a list of trusted parameters through.
    def user_params
      params.require([:first_name, :last_name, :username])
      params.fetch(:user, {}).permit(:first_name, :last_name, :username, :is_superuser)
    end

    def require_super_user_or_user_himself
      return if @current_user_id == params[:id].to_i || @current_user.is_superuser?

      return render json: { message: "You need to be signed in as user '#{params[:id]}' or as a superuser to procceed." }, status: :forbidden
    end
end
