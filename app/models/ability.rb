class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.admin?
      can :manage, Project
      can :manage, Task
      can :manage, User
    else
      can :developer
  	end

  end
end
