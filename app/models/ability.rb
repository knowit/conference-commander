class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    guest_abilities
    return unless user

    common_abilities

    # roles are defined in user model
    case user.role
    when 'administrator' administrator_abilities
    when 'organizer' organizer_abilities
    when 'speaker' speaker_abilities
    when 'participant' participant_abilities
    end
  end

  def common_abilities
    can :manage, [User] do |user|
      # allow users to manage themselves
      @user == user
    end
  end

  def administrator_abilities
    can :manage, :all
  end

  def organizer_abilities
  end

  def speaker_abilities
  end

  def participant_abilities
  end

  def guest_abilities
    can :read, [Event]
  end
end
