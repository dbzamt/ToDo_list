class ProjectsController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_filter :set_project, :only => [:get_developers,:get_tasks]
  def index

  	@projects = Project.all
  	@developers = User.where(admin:false)

    @admin_developers_view = Array.new
    @developers.each do |developer| 
      task = Hash.new
      task['name'] = developer.name if developer.name.present?
      task_names = developer.tasks.where(status:"New").pluck(:name).join(', ')
      task["new"] = task_names
      task_names = developer.tasks.where(status:"InProgress").pluck(:name).join(', ')
      task["progress"] = task_names
      task_names = developer.tasks.where(status:"Done").pluck(:name).join(', ')
      task["done"] = task_names
      @admin_developers_view << task
    end 

    @admin_project_view = Array.new
    @projects.each do |project| 
      task = Hash.new
      task['name'] = project.name if project.name.present?
      task_names = project.tasks.where(status:"New").pluck(:name).join(', ')
      task["new"] = task_names
      task_names = project.tasks.where(status:"InProgress").pluck(:name).join(', ')
      task["progress"] = task_names
      task_names = project.tasks.where(status:"Done").pluck(:name).join(', ')
      task["done"] = task_names
      @admin_project_view << task
    end 
  
    @tasks = Task.all

    @projects = User.where(admin:false).first.projects

  end

  def get_developers
    users = @project.users
    render json: users, status: :ok  
  end

  def get_tasks
    tasks  = Task.all
    render json: tasks , status: :ok
  end

  def create
  	project = Project.new(create_project_params)
  	if project.save
  		params[:developers].each do |developer_id|
  			ProjectDeveloper.create(project_id:project.id, user_id:developer_id)
  		end
  	end
  	redirect_to  root_path,flash: {success: "Project Successfully Created"}
  end

  private

  def create_project_params
  	params.permit(:name,:description)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
