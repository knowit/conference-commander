module Crudable

  extend ActiveSupport::Concern

  included do
    before_action :set_crudable
    before_action :set_crudable_name
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

  def set_crudable
    @crudable = member || collection
  end

end
