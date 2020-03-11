class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :live_yet, :notyet]
  before_action :set_artist, only: [:new, :create ,:live_yet, :done]
  before_action :status_change, only: [:live_yet, :done]

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
      redirect_to live_yet_posts_path
    else
      render :new
    end
  end


  def live_yet    
    @posts = Post.where(user_id: current_user.id, status: '1').order(date_time: "ASC")
  end


  def done
    @dones = Post.where(user_id: current_user.id, status: '0').order(date_time: "ASC")
  end


  def notyet
  end


  def not_yet
  end


  def yet
  end


  private

  def post_params
    params.require(:post).permit(:station, :fee, :venue, :date_time, :form_id, :how_long_id ).merge(user_id: current_user.id, artist_id: @artist.id)
  end


  def set_artist
    @artist_info = current_user.artist
  end


  def status_change 
    @status = Post.order(date_time: "ASC").find_by(user_id: current_user.id, status: '1')
    @time = DateTime.now.to_s(:db)
    if @status.present?
      if @status.date_time < @time
        @status.status = '0'
        @status.save
      end
    end
  end


end
