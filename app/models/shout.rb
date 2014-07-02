class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, polymorphic: true
  
  def index
  	@shouts = Shout.order("created_at").page(params[:page]).per(5)
  end
end
