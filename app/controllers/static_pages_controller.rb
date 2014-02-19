class StaticPagesController < ApplicationController
	def home
		@projects = Project.all(order: "created_at DESC")
	end
	
	def about
	end
	
	def contact
	end
end
