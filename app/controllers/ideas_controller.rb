class IdeasController < ApplicationController
  before_action :require_user
  before_action :which_user
  before_action :which_idea, only: [:show, :edit, :update, :destroy]
  def index
    @ideas = @user.ideas
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = @user.ideas.new(idea_params)
    @idea.user_id = @user.id
    if @idea.save
      flash[:success] = "Idea Saved"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @idea = Idea.find(params[:user_id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} was Updated."
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    flash[:success] = "Idea Deleted"
    redirect_to user_path(@idea.user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content)
  end

  def which_user
    @user = current_user
  end

  def which_idea
    @idea = Idea.find(params[:id])
  end
end
