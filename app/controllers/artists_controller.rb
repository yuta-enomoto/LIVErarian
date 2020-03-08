class ArtistsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]

  def show 
    @artist_info = current_user.artist
  end

  def new
    @artist = Artist.new
  end

  def create 
    @artist = Artist.new(artist_params)

    if current_user.artist.blank? && @artist.save
      redirect_to artist_path(@artist.id)
    else
      render :new
    end
  end

  def edit 
    @artist_info = current_user.artist
  end

  def update 
    if current_user.id == @artist.user_id && @artist.update(artist_params)
      redirect_to artist_path(@artist.id)
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
end