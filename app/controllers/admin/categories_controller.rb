class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
    @user = current_user
  end

  def new
    @category = Category.new
    @user = current_user
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} successfully created"
      redirect_to admin_category_path(@category)
    else
      flash[:error] = "#{@category.title} not saved. try again?"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @user = current_user
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Category Deleted"
      redirect_to admin_categories_path
    else
      flash[:error] = "Category was not Deleted. Try again?"
      render admin_categories_path
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end
