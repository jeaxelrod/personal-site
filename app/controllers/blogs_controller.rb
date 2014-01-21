class BlogsController < ApplicationController
	before_action :signed_in_admin, only: [:new]

	def new
		@blog = Blog.new
	end
	
	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			redirect_to blogs_url
		else 
			render 'new'
		end
	end
	
	def index
		@blogs = Blog.all
	end
	
	def show 
	end
	
	private
	
		def signed_in_admin
			unless session[:admin_id]
				redirect_to :back
			end
		end
		
		def blog_params
			params.require(:blog).permit(:title,:contents, :tags)
		end
end
