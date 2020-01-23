class ProjectsController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  	@projects = Project.all

  end

  def create
  	project = Project.new(create_project_params)
  	project.save
  	redirect_to  :action => 'index'
  end

  private

  def create_project_params
  	params.permit(:name,:description)
  end
end
