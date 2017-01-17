class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end
end
