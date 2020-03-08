class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create 
    if @artist.save
      redirect_to user_path
    else
      render :new
    end
  end

end
