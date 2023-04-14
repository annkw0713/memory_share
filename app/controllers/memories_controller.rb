class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
    @memory = Memory.find(params[:id])
    @comment = Comment.new
    @comments = @memory.comments.includes(:user)
  end

  def new
    @memory = Memory.new
    @following_users = current_user.followings
  end

  def create
    @memory = Memory.new(memory_params)
    user = User.find_by(id: params[:memory][:user_id])
    if user && (current_user.followings.include?(user) || current_user == user)
      @memory.user = user
      if @memory.save
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to new_memory_path, alert: '正しいユーザーを選択してください。'
    end
  end

  def edit
  end

  def update
    if @memory.update(memory_params)
      redirect_to memory_path(@memory.id)
    else
      render :edit
    end
  end

  def destroy
    return unless @memory.destroy

    redirect_to root_path
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def check_user
    return unless current_user != @memory.user

    redirect_to root_path
  end

  def memory_params
    params.require(:memory).permit(:title, :date, :person, :place, :description, :movie, {images: []}).merge(user_id: current_user.id)
  end

end
