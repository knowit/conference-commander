class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :passport_first_name, :string
    add_column :users, :passport_last_name, :string
    add_column :users, :passport_number, :string
    add_column :users, :passport_issued_at, :date
    add_column :users, :passport_expires_at, :date
    add_column :users, :passport_nationality, :string
    add_column :users, :birth_date, :date
  end
end
