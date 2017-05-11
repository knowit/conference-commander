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
    case step
    when :complete_profile
      @user = current_user
      @user.update(wizard_params)
      render_wizard @user
    when :add_participation
      @participation = Event.last.participation.first_or_initialize(user: current_user)
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
