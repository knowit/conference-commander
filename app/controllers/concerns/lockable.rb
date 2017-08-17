module Lockable

  extend ActiveSupport::Concern

  included do
    has_many :locks, as: :lockable
    accepts_nested_attributes_for :locks
  end

  def lock!(field)
    locks.find_or_create_by(field: field).touch(:locked_at)
  end

  def unlock!(field)
    locks.find_by(field: field).destroy!
  end

  def lock(field, lock_date)
    locks.find_or_create_by(field: field, locked_at: lock_date)
  end

  def locked?(field)
    locks.where(field: field).where('locked_at < ?', Date.today).exists?
  end

  def locked_fields
    locks.where('locked_at < ?', Date.today).pluck(:field)
  end

end
