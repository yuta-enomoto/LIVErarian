class SearchesController < ApplicationController
  
  def post_search
    if params[:q][:status_in] == '1'
      @search_post = Post.where(now_on: '1').ransack(params[:q])
      set_post

    elsif params[:q][:status_in].present?
      @search_post = Post.ransack(params[:q])
      set_post

    else
      @search_post = Post.where(status: '1').ransack(params[:q])
      set_post
    end
  end


  def artist_search
  end

  private

  def set_post
    @posts = @search_post.result.order(date_time: "ASC").page(params[:page])
  end

end
