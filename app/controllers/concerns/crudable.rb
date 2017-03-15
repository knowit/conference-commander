module Crudable
  extend ActiveSupport::Concern

  included do
    attr_reader :resource
  end

  def resource
    controller_name.classify.constantize
  end

end
