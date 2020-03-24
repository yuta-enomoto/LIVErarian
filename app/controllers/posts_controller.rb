class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy, :destroy_post,:done_destroy, :live_yet, :notyet]
  before_action :set_post, only: [:show, :show_post, :show_house, :edit, :update, :destroy, :destroy_post, :done_destroy, :done_show]
  before_action :artist_id, only: [:edit, :create, :update]
  before_action :count_post, only: [:show_post, :show_house]
  before_action :gon_set, only: [:show, :done_show, :show_post, :show_house]

  def show
  end


  def done_show
  end


  def show_post
  end


  def show_house
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
      redirect_status
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
      redirect_status
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


  def destroy_post
    if current_user.id == @post.user_id && @post.destroy
      redirect_to root_path
    else
      redirect_to post_path(@post.id)
    end
  end


  def done_destroy
    if current_user.id == @post.user_id && @post.destroy
      redirect_to done_posts_path
    else
      redirect_to done_destroy_post_path(@post.id)
    end
  end


  def live_yet    
    @posts = Post.where(user_id: current_user.id, status: '1').order(date_time: "ASC").page(params[:page]).per(6)
    @count = Post.where(user_id: current_user.id, status: '1').length
  end


  def done
    @dones = Post.where(user_id: current_user.id, status: '0').order(date_time: "ASC").page(params[:page]).per(6)
    @count = Post.where(user_id: current_user.id, status: '0').length

  end


  def notyet
  end


  def not_yet
  end


  def yet
  end


  private

  def post_params
    params.require(:post).permit(:station, :address, :fee, :venue, :date_time, :form_id, :how_long_id ).merge(user_id: current_user.id, artist_id: @artist.id)
  end


  def set_post
    @post = Post.find(params[:id])
  end


  def artist_id
    @artist = Artist.find_by(user_id: current_user.id)
  end


  def redirect_status
    if @post.status == true
      redirect_to post_path(@post.id)
    elsif @post.status == false
      redirect_to done_show_post_path(@post.id)
    end
  end


  def count_post
    @count_yet = Post.where(user_id: @post.user_id, status: '1').length
    @count_done = Post.where(user_id: @post.user_id, status: '0').length
  end


  def gon_set
    gon.latitude = @post.latitude
    gon.longitude = @post.longitude
    gon.venue = @post.venue
  end

end
