class CommentsController < ApplicationController
  before_action :find_memory
  before_action :set_comment, only: [:destroy]
  before_action :check_user, only: [:destroy]

  def create
    @comment = @memory.comments.create(comment_params)
    redirect_to memory_path(@memory.id)
  end

  def destroy
    return unless @comment.destroy

    redirect_to memory_path(@memory.id)
  end

  private

  def find_memory
    @memory = Memory.find(params[:memory_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user
    return unless current_user != @comment.user

    redirect_to root_path
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, memory_id: params[:memory_id])
  end

end
