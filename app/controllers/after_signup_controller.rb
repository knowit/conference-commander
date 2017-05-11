class AfterSignupController < ApplicationController

  include Wicked::Wizard

  steps :complete_profile, :add_participation

  def show
    case step
    when :complete_profile
      @user = current_user
    when :add_participation
      @participation = Event.last.participations.new(user: current_user)
    end
    render_wizard
  end

  def update
    # NOOP
  end

end
