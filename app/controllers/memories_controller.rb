class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to root_path
    else
      render :new
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
