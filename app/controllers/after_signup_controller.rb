class AfterSignupController < ApplicationController

  include Wicked::Wizard

  steps :complete_profile, :add_participation

  def show
    @event = Event.last
    @user = current_user

    case step
    when :complete_profile
    when :add_participation
      @participation = @event.participations.where(user: current_user).first || @event.participations.new(user: current_user)
    end
    render_wizard
  end

  def update
    @event = Event.last
    @user = current_user
    case step
    when :complete_profile
      @user.update(wizard_params)
      render_wizard @user
    when :add_participation
      @participation = @event.participations.where(user: current_user).first || @event.participations.new(user: current_user)
      @participation.update(wizard_params)
      render_wizard @participation
    end
  end

  private

  def wizard_params
    case step
    when :complete_profile
      params.require(:user).permit!
    when :add_participation
      params.require(:participation).permit!
    end
  end

end
