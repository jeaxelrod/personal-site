class StaticPagesController < ApplicationController
	def home
		@current_user = current_user
	end
	
	def about
		@current_user = current_user
	end
	
	private
		
		def current_user 
			admin_id = session[:admin_id]
			if admin_id
				Admin.find(admin_id)
			else
				@current_user
			end
		end
end
