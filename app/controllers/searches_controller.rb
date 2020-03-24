class SearchesController < ApplicationController
  
  def post_search
    if params[:q][:status_in].present?
      @search_post = Post.ransack(params[:q])
      @posts = @search_post.result.order(date_time: "ASC").page(params[:page])

    else
      @search_post = Post.where(status: '1').ransack(params[:q])
      @posts = @search_post.result.order(date_time: "ASC").page(params[:page])
    end
  end


  def artist_search
  end

end
