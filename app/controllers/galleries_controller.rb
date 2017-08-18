class GalleriesController < InheritedResources::Base
  before_filter :set_gallery, only: [:edit, :update, :show, :destroy]

  def index
    @galleries = Gallery.all
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

  private

    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:name, :image)
    end
end

