class FavoritesController < ApplicationController
  before_action :set_favorite

  def create
    @favorite = Favorite.create(user_id: current_user.id, artist_id: params[:artist_id])
  end


  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, artist_id: params[:artist_id])
    @favorite.destroy
  end

  
  private

  def set_favorite
    @artist = Artist.find(params[:artist_id])
    @id_name = "#favorite-link-#{@artist.id}"
  end


end
