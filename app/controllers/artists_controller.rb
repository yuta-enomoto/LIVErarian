class ArtistsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :notyet]
  before_action :set_params, only: [:show, :edit, :update]
  before_action :set_artist, only: [:index,:show, :edit, :update]

  def show
    @count_yet = Post.where(user_id: @artist.user_id, status: '1').length
    @count_done = Post.where(user_id: @artist.user_id, status: '0').length
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

  def set_artist 
    if user_signed_in? && current_user.artist.present?
      @artist_info = current_user.artist
    end
  end

end