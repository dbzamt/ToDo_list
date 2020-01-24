class ProjectsController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_filter :set_project, :only => [:get_developers,:get_tasks]
  def index

  	@projects = Project.all
  	@developers = User.where(admin:false)

    @projects = User.where(admin:false).first.projects
    # debugger

  end

  def get_developers
    users = @project.users
    render json: users, status: :ok  
  end

  def get_tasks
    @tasks  = Task.all
    render json:@tasks , status: :ok
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

  def set_project
    @project = Project.find(params[:project_id])
  end
end
