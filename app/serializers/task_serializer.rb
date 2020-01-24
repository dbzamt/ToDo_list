class TaskSerializer < ActiveModel::Serializer
  attributes :id,:name,:description,:project_name,:status
  
  # def name
  # 	object.name
  # end

  # def desc
  # 	object.description
  # end

  def project_name
  	# debugger
  	return object.project.name if object.project.present?
  	return ""
  end

  # def task_status
  # 	object.status
  # end

end
