class SearchesController < ApplicationController
  
  def post_search
    @posts_all = Post.all
    @q = Post.ransack(params[:q])
    @search_post = Post.ransack(params[:q])
    @posts = @search_post.result.page(params[:page])
  end


  def artist_search
  end

end
