class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user

    @user = user

    # roles are defined in user model
    case user.role
    when 'administrator' then administrator_abilities
    when 'organizer' then organizer_abilities
    when 'speaker' then speaker_abilities
    when 'participant' then participant_abilities
    else guest_abilities
    end
  end

  def common_abilities
    can :update, User, user_id:  @user.id
    can :read, User
    can :stop_impersonating, User
    can :update, EventSession, submitter_id: @user.id # allow users to manage own event sessions
  end

  def administrator_abilities
    can :manage, :all
  end

  def organizer_abilities
    can :manage, Lock
    common_abilities
  end

  def speaker_abilities
    common_abilities
  end

  def participant_abilities
    common_abilities
    can :read, [Event, Participation, Activity, EventSession]
    can :update, Participation, user_id: @user.id
  end

  def guest_abilities
    can :read, Event
  end
end
