class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :status_change

  private

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday])
  end


  def status_change 
    @status = Post.order(date_time: "ASC").find_by(status: '1')
    @time = DateTime.now.to_s(:db)
    if @status.present?
      if Rails.env.production?
        if @status.date_time < @time
          @status.status = '0'
          @status.save
        end
      else
        if @status.date_time + 9.hour < @time
          @status.status = '0'
          @status.save
        end
      end
    end
  end

end
