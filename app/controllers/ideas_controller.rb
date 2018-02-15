class IdeasController < ApplicationController
  before_action :require_user
  before_action :which_user, except: [:create]
  before_action :which_idea, only: [:show, :edit, :update, :destroy]
  def index
    @ideas = @user.ideas
  end

  def new
    @categories = Category.all
    @images = Image.all
    @idea = @user.ideas.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    set_images
    if @idea.save
      flash[:success] = "Idea Saved"
      redirect_to user_ideas_path
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  def show
  end

  def edit
    @categories = Category.all
    @images = Image.all
  end

  def update
    @idea.idea_images.destroy_all
    set_images
    if @idea.update(idea_params)
      flash[:success] = "#{@idea.title} was Updated."
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    flash[:success] = "Idea Deleted"
    redirect_to user_ideas_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content, :user, :category_id)
  end

  def which_user
    @user = current_user
  end

  def which_idea
    @idea = Idea.find(params[:id])
  end

  def set_images
    @idea.images << params[:images].map { |f| Image.find(f) }
  end
end
