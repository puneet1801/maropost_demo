class Api::HomeController < ApplicationController
  protect_from_forgery with: :null_session

  def create_user
    user = User.new(user_params)
    if user.save
      render json: {code: 200, status: "Success", message: "User created Successfully"}
    else
      render json: {code: 500, status: "Failure", message: user.errors.messages}
    end
  end

  def create_gallery
    gallery = Gallery.new(gallery_params)
    if gallery.save
      render json: {code: 200, status: "Success", message: "Gallery created Successfully"}
    else
      render json: {code: 500, status: "Failure", message: gallery.errors.messages}
    end
  end

  def contact_form
    begin
      UserMailer.acknowledgement_user(params).deliver_now()
      render json: {code: 200, status: "Success", message: "Contact form submitted."}
    rescue Exception => e
      render json: {code: 500, status: "Failure", message: e.message}
    end
  end

  def get_gallery
    gallery = Gallery.where(id: params[:id]).first
    if gallery.blank?
      render json: {code: 500, status: "Failure", message: "No Gallery Found."}
    else
      render json: {code: 200, status: "Success", message: "Successful", data: gallery}
    end
  end

  def no_route
    render json: {code: 500, status: "Failure", message: "No route matches"}
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def gallery_params
    params.require(:gallery).permit(:name, :remote_image_url)
  end
end