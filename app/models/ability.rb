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
    can :update, [User] do |user|
      @user == user # allow users to manage themselves
    end
    can :read, User
    can :manage, [EventSession] do |event_session|
      event_session.submitter.nil? || event_session.submitter == @user # allow users to manage own event sessions
    end
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
    can :read, [Event, Participation, Activity, EventSession]
    can :manage, [Participation] do |p|
      p.user.nil? || p.user == @user # allow users to manage own participation
    end
  end

  def guest_abilities
    can :read, [Event]
  end
end
