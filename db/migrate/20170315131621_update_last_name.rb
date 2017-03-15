class UpdateLastName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string, null: false, default: "X"
    change_column :users, :first_name, :string, null: false
  end
end
