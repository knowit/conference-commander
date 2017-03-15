module Crudable
  extend ActiveSupport::Concern

  included do
    before_action :set_resource
  end

  def set_resource
    @resource = controller_name.classify.constantize
  end

end
