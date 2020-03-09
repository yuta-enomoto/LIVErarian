class PostsController < ApplicationController
  def new
    @artist_info = current_user.artist
  end

  def create
  end
end
