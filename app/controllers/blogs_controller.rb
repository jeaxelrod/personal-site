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
		if params[:tag]
			@blogs = []
			Blog.all.each do |blog|
				if blog.tags.downcase.include? params[:tag]
					@blogs.append(blog)
				end
			end
		else
			@blogs = Blog.all
		end
	end
	
	def edit
		@blog = Blog.find(params[:id])
	end
	
	def update
		@blog = Blog.find(params[:id])
		if @blog.update_attributes(blog_params)
			redirect_to blogs_url
		else
			render 'edit'
		end
	end
	
	def destroy 
		Blog.find(params[:id]).destroy
		redirect_to blogs_url
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
