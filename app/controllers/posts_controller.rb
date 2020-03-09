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
    Post.create(post_params)
  end

  def notyet
  end

  private
  def post_params
    params.require(:post).permit(:station, :fee, :venue, :date_time, :form_id, :how_long_id ).merge(user_id: current_user.id, artist_id: params[:artist_id])
  end
end
