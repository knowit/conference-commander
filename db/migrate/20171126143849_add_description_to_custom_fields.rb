class AddDescriptionToCustomFields < ActiveRecord::Migration[5.1]
  def change
    add_column :custom_fields, :description, :string
  end
end
