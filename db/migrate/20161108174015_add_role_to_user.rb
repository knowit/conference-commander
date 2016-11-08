class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :role, default: 3, null: false
    end
  end
end
