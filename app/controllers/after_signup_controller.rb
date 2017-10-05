class AfterSignupController < ApplicationController

  include Wicked::Wizard

  steps :complete_profile, :select_event, :add_participation

  def show
    @event = Event.where(id: session[:event_id]).first
    @user = current_user

    case step
    when :complete_profile
      @user.build_passport unless @user.passport
    when :select_event
    when :add_participation
      @participation = @event.participations.where(user: current_user).first || @event.participations.new(user: current_user)
    end
    render_wizard
  end

  def update
    @user = current_user
    case step
    when :complete_profile
      @user.update(wizard_params)
      render_wizard @user
    when :select_event
      session[:event_id] = params[:wizard][:event_id]
      @event = Event.find(session[:event_id])
      render_wizard @event
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
    when :select_event
      params.require(:wizard).permit(:event_id)
    when :add_participation
      params.require(:participation).permit!
    end
  end
end
