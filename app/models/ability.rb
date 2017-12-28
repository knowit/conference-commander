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
    can :update, User, id:  @user.id
    can :read, User
    can :stop_impersonating, User
    can [:update, :manage], EventSession, submitter_id: @user.id # allow users to manage own event sessions
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
    can :read, [Event, Activity, EventSession]
  end

  def participant_abilities
    common_abilities
    can :read, [Event, Activity, EventSession]
    can :create, EventSession
    can [:create, :read, :update], Participation, user_id: @user.id
    cannot [:destroy], EventSession do |session|
      session.locked?
    end
  end

  def guest_abilities
    can :read, Event
  end
end
