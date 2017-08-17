class AddFieldsToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :ingress, :string
    add_column :activities, :price, :integer
    add_column :activities, :max_number_of_participants, :integer
  end
end
