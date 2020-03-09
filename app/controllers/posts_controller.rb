class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :notyet]

  def new
    @artist_id = Post.includes(:artist).where(user_id: current_user.id)
    @artist_info = current_user.artist
    if current_user.artist.present?
      @post = Post.new
    else 
      redirect_back(fallback_location: users_path)
    end
  end


  def create
    @artist = Artist.find_by(user_id: current_user.id)
    @post = Post.new(post_params)
    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end


  def notyet
  end

  private
  def post_params
    params.require(:post).permit(:station, :fee, :venue, :date_time, :form_id, :how_long_id ).merge(user_id: current_user.id, artist_id: @artist.id)
  end
end
