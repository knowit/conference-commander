class EventProposalsController < ApplicationController
  before_action :set_event
  before_action :set_proposal, except: [:index, :new, :create]

  def index
    @proposals = @event.proposals
  end

  def create
    @proposal = @event.proposals.build(proposal_params)
    if @proposal.save
      redirect_to event_proposals_url(@event)
    else
      p @proposal.errors.inspect
      render "proposals/new"

    end
  end

  def new
    @proposal = Proposal.new

    render "proposals/new"
  end

  def show
  end

  def edit
    render "proposals/edit"
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to event_proposals_url(@event)
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to event_proposals_url(@event)
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :description, :duration, :user_id)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end
end
