class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_task, :only => [:update_status]


	def create
    Task.create(createTaskParams)
    message =  I18n.t 'task.created.message'
    redirect_to root_path, flash: {success: message}
  end

  def index
    tasks = Task.where(status:"new")
  end

  def update_status
    @task.status = params[:status]
    if @task.save
      message =  I18n.t 'task.updated.success'

      redirect_to root_path, flash: {success: "Task Updated Successfully"}
    else
      message =  I18n.t 'task.updated.error'
      redirect_to root_path, flash: {danger: "Error occured while Updating"}
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
