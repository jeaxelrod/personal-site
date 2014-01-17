class SessionsController < ApplicationController
	def new
	end
	
	def create
		admin = Admin.find_by(username: params["username"])
		if admin && admin.authenticate(params["password"])
			session[:admin_id] = admin.id
			self.current_user = admin
			redirect_to ''
		else
			render 'new'
		end 	
	end
	
	def destroy
		reset_session
		redirect_to :back
	end
	
	private
		
		def current_user=(user)
			@current_user = user
		end
		
		def current_user
			admin_id = session[:admin_id]
			@current_user ||= Admin.find(admin_id)
		end
end
