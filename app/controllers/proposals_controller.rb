class ProposalsController < ApplicationController
  before_action :set_user
  before_action :set_proposal, except: [:index, :new, :create]

  def index
    @proposals = @user.proposals
  end

  def create
    @proposal = @user.proposals.build(proposal_params)
    if @proposal.save
      redirect_to user_proposals_url(@user)
    else
      render :new
    end
  end

  def new
    @proposal = Proposal.new
  end

  def show
  end

  def edit
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to user_proposals_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to user_proposals_url(@user)
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :description, :duration, :event_id)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end
end
