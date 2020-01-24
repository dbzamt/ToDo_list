class Project < ActiveRecord::Base
	has_many :tasks
	has_many :project_developers
    has_many :users, through: :project_developers
end
