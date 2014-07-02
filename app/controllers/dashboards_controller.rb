class DashboardsController < ApplicationController
  def show
    @shout = Shout.new
    @image_subject = ImageSubject.new
  end
end
