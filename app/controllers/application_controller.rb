class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_artist
  before_action :set_ransack
  before_action :set_ransack_artist
  before_action :now_on_change
  before_action :status_change

  private


  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday])
  end


  def set_ransack
    @posts_all = Post.where(status: '1')
    @q = Post.ransack(params[:q])
  end


  def set_ransack_artist
    @artists_all = Artist.all
    @p = Artist.ransack(params[:q])
  end


  def set_artist 
    if user_signed_in? && current_user.artist.present?
      @artist_info = current_user.artist
    end
  end


  def now_on_change
    30.times do
      @now_on = Post.order(date_time: "ASC").find_by(status: '1', now_on: '1')
      @time = DateTime.now.to_s(:db)
      if @now_on.present?
        if Rails.env.production?
          if @now_on.date_time < @time
            @now_on.now_on = '0'
            @now_on.save
          end
        else     
          if @now_on.date_time + 9.hour < @time
            @now_on.now_on = '0'
            @now_on.save
          end
        end
      end
    end
  end

  def status_change 
    30.times do
      @status = Post.order(date_time: "ASC").find_by(status: '1', now_on: '0')
      @time = DateTime.now.to_s(:db)
      if @status.present?
        if Rails.env.production?
          if @status.how_long_id == 1
            if @status.date_time + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 2
            if @status.date_time + 1.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 3
            if @status.date_time + 1.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 4
            if @status.date_time + 2.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 5
            if @status.date_time + 2.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 6
            if @status.date_time + 3.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 7
            if @status.date_time + 3.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 8
            if @status.date_time + 4.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
        else
          if @status.how_long_id == 1
            if @status.date_time + 9.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 2
            if @status.date_time + 10.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 3
            if @status.date_time + 10.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 4
            if @status.date_time + 11.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 5
            if @status.date_time + 11.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 6
            if @status.date_time + 12.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 7
            if @status.date_time + 12.hour + 30.minute < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
          if @status.how_long_id == 8
            if @status.date_time + 13.hour < @time
              @status.now_on = '1'
              @status.save
              @status.status = '0'
              if @status.save
                @like_delete = Like.where(post_id: @status.id)
                @like_delete.delete_all
              end
            end
          end
        end
      end
    end
  end
end
