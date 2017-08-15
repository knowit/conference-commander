class CreatePassports < ActiveRecord::Migration[5.1]
  def change
    create_table :passports do |t|
      t.references :user, foreign_key: true
      t.string :encrypted_first_name
      t.string :encrypted_first_name_iv
      t.string :encrypted_last_name
      t.string :encrypted_last_name_iv
      t.string :encrypted_number
      t.string :encrypted_number_iv
      t.string :encrypted_nationality
      t.string :encrypted_nationality_iv
      t.timestamps
    end
  end
end
