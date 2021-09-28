class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_action :set_current_user

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    error = {}
    error[parameter_missing_exception.param] = ['parameter is required']
    render json: { errors: error }, status: :bad_request
  end

  private

  def set_current_user
    return unless request.headers["Authorization"]
    @current_user = User.find_by_api_key(request.headers["Authorization"]) 

    return unless @current_user
    @current_user_id = @current_user.id
  end

  def require_user
    return if @current_user

    return render json: { message: "Could not authentifie a user using the authentication header value" }, status: :unauthorized
  end

  def access_params
    params.fetch(:access, {}).permit(:controller, :action).merge({ record_id: params[:id] })
  end

  def require_super_user_or_image_owner
    return if @current_user.owns_image?(params[:image_id]) || @current_user.is_superuser?

    return render json: { message: "You need to be signed in as the image owner to proceed." }
  end
end
