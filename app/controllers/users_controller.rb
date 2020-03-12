class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update]
  before_action :set_artist, only: [:index, :edit, :update]

  def index
  end

  def edit 
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,:birthday)
  end

  def set_artist 
    if user_signed_in? && current_user.artist.present?
      @artist_info = current_user.artist
    end
  end

end
