class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.where("nickname LIKE ?", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
