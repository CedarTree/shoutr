class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @timeline = current_user.timeline.order("created_at DESC").
    page(params[:page]).per(5)
    @image_subject = ImageSubject.new
  end
end
