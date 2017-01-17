class ProposalsController < ApplicationController

  #layout 'crudable'

  def index
    @proposals = Proposal.all
  end
end
