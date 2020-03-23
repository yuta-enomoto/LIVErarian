class SearchesController < ApplicationController
  
  def post_search
    if params[:q][:artist_name_or_station_or_venue_or_address_cont].empty?

    else
      @search_post = Post.ransack(params[:q])
      @posts = @search_post.result.order(date_time: "ASC").page(params[:page])
      # binding.pry
    end
  end


  def artist_search
  end

end
