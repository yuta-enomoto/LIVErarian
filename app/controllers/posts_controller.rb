class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @artist_info = current_user.artist
    if current_user.artist.present?
      @post = Post.new
    else 
      redirect_back(fallback_location: users_path)
    end
  end

  def create
  end

  def notyet
  end

end
