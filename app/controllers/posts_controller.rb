class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :notyet]
  before_action :set_artist, only: [:new, :create ,:live_yet]

  def new
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

  
  def live_yet
  end


  def notyet
  end

  private
  def post_params
    params.require(:post).permit(:station, :fee, :venue, :date_time, :form_id, :how_long_id ).merge(user_id: current_user.id, artist_id: @artist.id)
  end

  def set_artist
    @artist_info = current_user.artist
  end
end
