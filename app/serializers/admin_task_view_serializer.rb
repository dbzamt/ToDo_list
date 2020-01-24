class AdminTaskViewSerializer < ActiveModel::Serializer
  attributes :id,:names,:status

  def name
  	object.name
  end

  def developer_name
  	object.developer.name
  end

  def status
  	object.status
  end
  
end
