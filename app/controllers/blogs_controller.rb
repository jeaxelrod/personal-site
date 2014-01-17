class BlogsController < ApplicationController
	before_action :signed_in_admin, only: [:new]

	def new
	end
	
	def index
		@blogs = Blog.all
	end
	
	def show 
	end
end
