class HomeController < ApplicationController


  def index
    @news = Artist.all.order(id: "DESC")
    @day = Date.today.to_s(:db)
    @todays = Post.where(date_time: Time.zone.now.all_day ,status: '1', form_id: '2').order(date_time: "ASC")
    @today_houses = Post.where(date_time: Time.zone.now.all_day ,status: '1', form_id: '1').order(date_time: "ASC")
  end

  
end