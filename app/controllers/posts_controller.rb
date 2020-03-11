class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy, :live_yet, :notyet]
  before_action :set_artist, except: [:destroy, :not_yet, :notyet, :yet]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :done_show]
  before_action :artist_id, only: [:edit, :create, :update]
  before_action :status_change, only: [:show, :done_show, :live_yet, :done]

  def show
  end

  def done_show
  end

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


  def edit 
    if @post.status == false
      redirect_to done_show_post_path(@post.id)
    end
  end


  def update
    if current_user.id == @post.user_id && @post.update(post_params)
      status_change
      if @status.status == true
        redirect_to post_path(@post.id)
      elsif @status.status == false
        redirect_to done_show_post_path(@post.id)
      end
    else
      render :edit
    end
  end


  def destroy
    if current_user.id == @post.user_id && @post.destroy
      redirect_to live_yet_posts_path
    else
      redirect_to post_path(@post.id)
    end
  end


  def live_yet    
    @posts = Post.where(user_id: current_user.id, status: '1').order(date_time: "ASC")
    @count = @posts.length
  end


  def done
    @dones = Post.where(user_id: current_user.id, status: '0').order(date_time: "ASC")
    @count = @dones.length
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


  def set_post
    @post = Post.find(params[:id])
  end

  def artist_id
    @artist = Artist.find_by(user_id: current_user.id)
  end


  def status_change 
    @status = Post.order(date_time: "ASC").find_by(user_id: current_user.id, status: '1')
    @time = DateTime.now.to_s(:db)
    if @status.present?
      if Rails.env.production?
        if @status.date_time < @time
          @status.status = '0'
          @status.save
        end
      else
        if @status.date_time + 9.hour < @time
          @status.status = '0'
          @status.save
        end
      end
    end
  end


end
