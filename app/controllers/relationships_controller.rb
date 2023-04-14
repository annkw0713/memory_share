class RelationshipsController < ApplicationController
  def followings
    @following_users = current_user.followings
  end

  def followers
    @follower_users = current_user.followers
  end
  
  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to root_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to root_path
  end

end
