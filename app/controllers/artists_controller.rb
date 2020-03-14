class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :notyet]
  before_action :set_params, only: [:show, :posts, :done_posts, :edit, :update]
  before_action :count, only: [:show, :posts, :done_posts]

  def show
    @count_yet = Post.where(user_id: @artist.user_id, status: '1').length
    @count_done = Post.where(user_id: @artist.user_id, status: '0').length
  end


  def posts
    @top_posts = @artist.posts.where(status: '1')
  end


  def done_posts
    @done_posts = @artist.posts.where(status: '0')
  end


  def new
    if current_user.artist.blank?
      @artist = Artist.new
    else 
      redirect_back(fallback_location: users_path)
    end
  end


  def create 
    @artist = Artist.new(artist_params)

    if current_user.artist.blank? && @artist.save
      redirect_to users_path
    else
      render :new
    end
  end


  def edit 
  end


  def update 
    if current_user.id == @artist.user_id && @artist.update(artist_params)
      redirect_to users_path
    else
      render :edit
    end
  end


  def notyet
  end

  
  private 

  def artist_params
    params.require(:artist).permit(:name, :introduction, :active_place, :image).merge(user_id: current_user.id)
  end


  def set_params 
    @artist = Artist.find(params[:id])
  end


  def count
    @count_yet = Post.where(user_id: @artist.user_id, status: '1').length
    @count_done = Post.where(user_id: @artist.user_id, status: '0').length
  end

end