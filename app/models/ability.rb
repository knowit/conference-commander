class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    guest_abilities
    if user && user.role == 'administrator'
      administrator_abilities
    end
  end

  def administrator_abilities
    can :manage, :all
  end

  def guest_abilities
    can :read, [Event]
  end
end
