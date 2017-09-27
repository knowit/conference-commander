class RemovePassportColumnsFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :encrypted_passport_first_name
    remove_column :users, :encrypted_passport_first_name_iv
    remove_column :users, :encrypted_passport_last_name
    remove_column :users, :encrypted_passport_last_name_iv
    remove_column :users, :encrypted_passport_number
    remove_column :users, :encrypted_passport_number_iv
    remove_column :users, :encrypted_issued_at
    remove_column :users, :encrypted_issued_at_iv
    remove_column :users, :encrypted_expires_at
    remove_column :users, :encrypted_expires_at_iv
    remove_column :users, :encrypted_passport_nationality
    remove_column :users, :encrypted_passport_nationality_iv
  end
end
