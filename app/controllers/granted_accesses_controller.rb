class GrantedAccessesController < ApplicationController
  before_action :set_granted_access, only: [:show, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_super_user_or_image_owner, except: [:index, :show]

  # GET /granted_accesses
  def index
    @granted_accesses = GrantedAccess.where(granted_access_params)

    render json: @granted_accesses
  end

  # GET /granted_accesses/1
  def show
    render json: @granted_access
  end

  # POST /granted_accesses
  def create
    @granted_access = GrantedAccess.new(granted_access_params)

    if @granted_access.save
      render json: @granted_access, status: :created
    else
      render json: @granted_access.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /granted_accesses/1
  def update
    if @granted_access.update(granted_access_params)
      render json: @granted_access
    else
      render json: @granted_access.errors, status: :unprocessable_entity
    end
  end

  # DELETE /granted_accesses/1
  def destroy
    @granted_access.destroy
  end

  # DELETE /granted_accesses
  def destroy_all
    @granted_accesses = GrantedAccess.where(granted_access_params)

    @granted_accesses.delete_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_granted_access
      @granted_access = GrantedAccess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def granted_access_params
      params.fetch(:granted_access, {}).permit(:image_id, :action).merge(user_id: params[:user_id].to_i)
    end
end
