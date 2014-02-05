class BlogsController < ApplicationController
	before_action :signed_in_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@blog = Blog.new
	end
	
	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			flash[:notice] = "Blog post created"
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
				@blogs = Kaminari.paginate_array(@blogs).page(params[:page]).per(5)
		else
			@blogs = Blog.page(params[:page]).per(5)
		end
	end
	
	def edit
		@blog = Blog.find(params[:id])
	end
	
	def update
		@blog = Blog.find(params[:id])
		if @blog.update_attributes(blog_params)
		  flash[:notice] = "Blog post updated"
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
			redirect_to root_url unless session[:admin_id]
		end
		
		def blog_params
			params.require(:blog).permit(:title,:contents, :tags)
		end
end
