class ProjectsController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  	@projects = Project.all
  	@developers = User.where(admin:false)

  end

  def create
  	# debugger
  	project = Project.new(create_project_params)
  	if project.save
  		params[:developers].each do |developer_id|
  			ProjectDeveloper.create(project_id:project.id, user_id:developer_id)
  		end
  	end
  	redirect_to  :action => 'index'
  end

  private

  def create_project_params
  	params.permit(:name,:description)
  end
end
