class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @artist_info = current_user.artist
  end

  def create
  end
end
