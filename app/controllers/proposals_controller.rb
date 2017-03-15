class ProposalsController < ApplicationController

  include Crudable

  load_and_authorize_resource :event
  load_and_authorize_resource through: :event

  def index
    @proposals = Proposal.all
  end
end
