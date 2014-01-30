class StaticPagesController < ApplicationController
	def home
		@projects = Project.all
	end
	
	def about
	end
	
	def contact
	end
end
