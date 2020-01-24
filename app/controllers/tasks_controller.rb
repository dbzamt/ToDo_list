class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_task, :only => [:update_status]


	def create
    Task.create(createTaskParams)
    redirect_to  :action => 'index', :controller=>"projects"
  end

  def index
    tasks = Task.where(status:"new")
  end

  def update_status
    @task.status = params[:status]
    if @task.save
      render json:{message:"Successfully Updated"} , status: :ok
    else
      render json:{message:"Error occured while Updating"} , status: :unprocessable_entity
    end
    
  end


  private

  def createTaskParams
    params.permit(:name,:description,:project_id,:user_id)
  end

  def set_task
    @task =Task.find(params[:task_id])
  end
end
