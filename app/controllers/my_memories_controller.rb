class MyMemoriesController < ApplicationController
  def index
    @memories = current_user.memories.order("created_at DESC")
  end
end
