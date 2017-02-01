class AddColumnAllergiesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :allergies, :text
  end
end
