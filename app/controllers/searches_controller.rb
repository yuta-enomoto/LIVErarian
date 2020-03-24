class SearchesController < ApplicationController
  
  def post_search
    @search_post = Post.ransack(params[:q])
    @posts = @search_post.result.order(date_time: "ASC").page(params[:page])
  end


  def artist_search
  end

end
