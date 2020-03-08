class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create 
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to users_path
    else
      render :new
    end
  end

  private 

  def artist_params
    params.require(:artist).permit(:name, :introduction, :active_place, :image).merge(user_id: current_user.id)
  end

end
