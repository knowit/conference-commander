module Crudable

  extend ActiveSupport::Concern

  included do
    before_action :set_crudable_name
    helper_method :crudable
  end


  def resource
    controller_name.classify.underscore
  end

  def member
    instance_variable_get("@#{resource}")
  end

  def collection
    instance_variable_get("@#{resource.pluralize}")
  end

  def set_crudable_name
    @crudable_name = controller_name.classify.constantize
  end

  def crudable
    member || collection
  end

end
