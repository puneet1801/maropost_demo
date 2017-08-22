class GalleriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery, only: [:edit, :update, :show, :destroy, :update_name]

  def index
    @galleries = Gallery.order("created_at DESC").page params[:page]
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to galleries_path, notice: "Gallery created successfully."
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @gallery.update(gallery_params)
      redirect_to galleries_path, notice: "Gallery updated successfully."
    else
      render :edits
    end
  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path, notice: "Gallery deleted successfully."
  end

  def update_name
  	if @gallery.update_attributes(name: params[:name])
  		render json: {status: true, message: "Name updated successfully.", color: "green"}
  	else
  		render json: {status: false, message: @gallery.errors.messages.to_s, color: "red"}
  	end
  end

  def import_csv
    if params[:file].blank?
      redirect_to galleries_path, alert: "No File to import"
    else
      data = Gallery.import(params[:file])
      redirect_to galleries_path, notice: data
    end
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name,:image)
  end
end

