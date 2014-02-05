class ProjectsController < ApplicationController
  before_action :signed_in_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
		@project = Project.new
  end
	
  def create
	  @project = Project.new(project_params)
		if @project.save
	    redirect_to root_url
		else
		  render 'new'
	  end
  end
	
  def edit
		@project = Project.find(params[:id])
  end

  def update
	  @project = Project.find(params[:id])
		if @project.update_attributes(project_params)
		  flash[:notice] = "#{@project.name} is updated"
		  redirect_to root_url
		else
		  render 'edit'
		end
  end
	
	def destroy
	  @project = Project.find(params[:id])
    flash[:notice] = "#{@project.name} is destroyed"
		@project.destroy
		redirect_to root_url
	end
	
 private
	
    def project_params
      params.require(:project).permit(:link, :description, :name, :gitlink)
		end
		
		def signed_in_admin 
		  redirect_to root_url unless session[:admin_id]
		end
end
