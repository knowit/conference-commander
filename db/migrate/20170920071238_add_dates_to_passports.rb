class AddDatesToPassports < ActiveRecord::Migration[5.1]
  def change
    add_column :passports, :encrypted_issued_at, :string
    add_column :passports, :encrypted_issued_at_iv, :string
    add_column :passports, :encrypted_expires_at, :string
    add_column :passports, :encrypted_expires_at_iv, :string
  end
end
