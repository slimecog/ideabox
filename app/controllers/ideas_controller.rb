class IdeasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    @idea.user_id = @user.id
    if @idea.save
      flash[:success] = "Idea Saved"
      redirect_to user_path(@idea.user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:user_id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "Idea Updated"
      redirect_to user_path(@idea.user)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:success] = "Idea Deleted"
    redirect_to user_path(@idea.user)
  end

  private

  def idea_params
    params.require(:idea).permit(:content)
  end
end
