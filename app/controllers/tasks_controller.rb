class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

	def create
    Task.create(createTaskParams)
    redirect_to  :action => 'index', :controller=>"projects"
  end

  def index
    tasks = Task.where(status:"new")
    # new_tasks = ActiveModel::ArraySerializer.new(tasks, each_serializer: RecordSerializer).to_json
    # tasks = Task.where(status:"inProgress")
    # progress_tasks = ActiveModel::ArraySerializer.new(tasks, each_serializer: RecordSerializer).to_json
    # taskss = Task.where(status:"done")
    # done_tasks = ActiveModel::ArraySerializer.new(tasks, each_serializer: RecordSerializer).to_json    
  end


  private

  def createTaskParams
    params.permit(:name,:description,:project_id,:user_id)
  end
end
