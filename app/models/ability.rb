# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    can :manage, Doctor # permissions for every user, even if not logged in
    if user.present?  # additional permissions for logged in users (they can manage their posts)
      can [:read, :create], Appointment
      can :read, :all
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
    end


    user ||= User.new # guest user (not logged in)

      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end

    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

end
