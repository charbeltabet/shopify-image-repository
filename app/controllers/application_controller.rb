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
    return unless request.headers["Authorization"].present?
    @current_user = User.find_by_api_key(request.headers["Authorization"]) 

    return unless @current_user
    @current_user_id = @current_user.id
  end

  def require_user
    return if @current_user

    return render json: { message: "Could not authentifie a user, the 'Authentification' header is non present or invalid" }, status: :unauthorized
  end

  def require_image_owner
    return if user_is_owner_or_superuser?

    return render json: { message: "You need to be signed in as the image owner to proceed." }
  end

  def user_is_owner_or_superuser?(user = @current_user)
    @image.user_id == user.id || user.is_superuser?
  end
end
