class HomeController < ApplicationController

  def index
    if user_signed_in?
      @artist_info = current_user.artist
    else

    end
  end

end