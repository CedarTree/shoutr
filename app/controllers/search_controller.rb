class SearchController < ApplicationController
	def index
		@search_users = User.search(params[:q])
	end

end
