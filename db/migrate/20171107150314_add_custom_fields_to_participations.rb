class AddCustomFieldsToParticipations < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :custom, :jsonb

  end
end