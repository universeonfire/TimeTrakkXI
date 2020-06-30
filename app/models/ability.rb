# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
     
    user ||= User.new  
    if user.admin_role?
      can :manage, :all
    end
     
     
  end
end
