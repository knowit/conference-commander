class AddsEncryptedInformationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :encrypted_passport_first_name, :string
    add_column :users, :encrypted_passport_first_name_iv, :string
    add_column :users, :encrypted_passport_last_name, :string
    add_column :users, :encrypted_passport_last_name_iv, :string
    add_column :users, :encrypted_passport_number, :string
    add_column :users, :encrypted_passport_number_iv, :string
    add_column :users, :encrypted_passport_nationality, :string
    add_column :users, :encrypted_passport_nationality_iv, :string
  end
end
