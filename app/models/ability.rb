class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    guest_abilities
    return unless user

    # roles are defined in user model
    case user.role
    when 'administrator' then administrator_abilities
    when 'organizer' then organizer_abilities
    when 'speaker' then speaker_abilities
    when 'participant' then participant_abilities
    end
  end

  def common_abilities
    can :update, [User] do |user|
      # allow users to manage themselves
      @user == user
    end
    can :read, User

    can :single_room_participants, Participation
  end

  def administrator_abilities
    can :manage, :all
  end

  def organizer_abilities
    common_abilities
  end

  def speaker_abilities
    common_abilities
  end

  def participant_abilities
    common_abilities
  end

  def guest_abilities
    can :read, [Event]
  end
end
