require "./app/serializers/image_serializer.rb"

class ImagesController < ApplicationController
  before_action :require_user, only: [:create, :update, :destroy, :transfer_ownership, :publicize, :privatize]
  before_action :set_image, only: [:show, :update, :destroy, :view, :transfer_ownership, :publicize, :privatize]
  before_action :require_authorized_user

  def index
    @images = Image.all

    render json: @images
  end

  def show
    render json: @image
  end
  
  def create
    @image = Image.create(image_params)

    if @image.valid?
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    if @image.update(image_params)
      render json: @image, status: :ok
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @image.destroy
  end

  def view
    if params[:mode] == "download"
      send_data @image.binary, type: "image/gif", disposition: "attachment; filename=\"#{@image.unique_name}\""
    elsif params[:mode] == "view"
      send_data @image.binary, type: "image/gif", disposition: "inline", status: :ok
    end
  end

  def transfer_ownership
    new_user_id = User.find_by!(username: params[:new_user]).id
    if new_user_id == @current_user_id
      render json: { message: "ownership transfer failed", errors: ["can't transfer ownership to yourself"], image: @image }, status: :unprocessable_entity
    elsif @image.ownership_transfer(new_user_id)
      render json: { message: "ownership transfer succeeded", image: @image }
    else
      render json: { message: "ownership transfer failed", errors: @image.errors, image: @image }, status: :unprocessable_entity
    end
  end

  def publicize
    @image.publicize
    return render json: { message: "Anyone can perform any action on this image"}, status: :ok
  end

  def privatize
    @image.privatize
    return render json: { message: "No one can perform any action on this image besides its owner"}, status: :ok
  end

  private

  def set_image
    if params[:unique_name]
      @image = Image.find_by!(unique_name: params[:unique_name])
    else
      @image = Image.find_by!(id: params[:image_id] || params[:id])
    end
  end

  def image_params
    params.fetch(:image, {}).permit(:title, :source_url).merge(user_id: @current_user_id)
  end

  def require_authorized_user
    return unless @image

    unless @image.can_user_take_action?(user_id: @current_user_id, action: params[:action])
      return render json: { message: "You need to be granted '#{params[:action]}' access or own the image to proceed." }, status: :forbidden
    end
  end
end
