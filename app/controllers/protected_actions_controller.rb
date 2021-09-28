class ProtectedActionsController < ApplicationController
  before_action :set_protected_action, only: [:show, :update, :destroy]
  before_action :require_user, only: [:index, :show]
  before_action :require_super_user_or_image_owner, except: [:index, :show]

  # GET /protected_actions
  def index
    @protected_actions = ProtectedAction.where(protected_action_params)

    render json: @protected_actions
  end

  # GET /protected_actions/1
  def show
    render json: @protected_action
  end

  # POST /protected_actions
  def create
    @protected_action = ProtectedAction.new(protected_action_params)

    if @protected_action.save
      render json: @protected_action, status: :created, location: @protected_action
    else
      render json: @protected_action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /protected_actions/1
  def destroy
    @protected_action.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protected_action
      @protected_action = ProtectedAction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def protected_action_params
      params.require(:action)
      params.fetch(:protected_action, {}).permit(:action).merge(image_id: params[:image_id])
    end
end
