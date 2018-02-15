class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
    @user = current_user
  end

  def new
    @image = Image.new
    @user = current_user
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image successfully Saved."
      redirect_to admin_images_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
    @user = current_user
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:success] = "Image successfully Edited."
      redirect_to admin_images_path
    else
      flash[:error] = "Something went wrong. Try again?"
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.idea_images.destroy_all
    if @image.destroy
      redirect_to admin_images_path
    else
      render :edit
    end
  end

  private

    def image_params
      params.require(:image).permit(:url)
    end
end
