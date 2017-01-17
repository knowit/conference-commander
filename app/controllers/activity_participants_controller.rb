class ActivityParticipantsController < ApplicationController
  before_action :set_activity_participant, except: [:index, :new, :create]

  def index
    @activity_participant = ActvityParticipant.all
  end

  def new
    @activity_participant = ActivityParticipant.new
  end

  def create
    @activity_participant = ActivityParticipant.new(activity_participant_params)

    if @activity_participant.save
      redirect_to @activity_participant
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @activity_participant.update(activity_participant_params)
      redirect_to @activity_participant
    else
      render :edit
    end
  end

  def destroy
    @activity_participant.destroy

    redirect_to activity_participant_url
  end

  private

  def activity_participant_params
    params.require(:activity_participant).permit(:activity_id, :user_id)
  end

  def set_activity_participant
    @activity_participant = ActivityParticipant.find(params[:id])
  end
end
