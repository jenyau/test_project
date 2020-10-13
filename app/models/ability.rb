# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def current_ability
    if admin_signed_in?
      @current_ability ||= AdminPowers.new(current_admin)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end


  def initialize(user)
    user ||= User.new
      if user.class == User
        can :read, [Appointment, Category, Doctor]
        can :read, User do |profile|
          profile.id == user.id
        end
        can :create, Appointment
        if user.admin?
          can :manage, :all
        end
      end
      if user.class == Doctor
        can :read, [Category,User]
        can [:read, :update], Appointment do |appointment|
          appointment.doctor.id == user.id
        end
        can :read, Doctor do |profile|
          profile.id == user.id
        end
      end












    # can :read, :all # permissions for every user, even if not logged in
    # if user.present?  # additional permissions for logged in users (they can manage their posts)
    #   can [:read, :create], Appointment


    #   can :read, :all
    #   if user.admin?  # additional permissions for administrators
    #     can :manage, :all
    #   end
    # end

    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
