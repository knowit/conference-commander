class AddGenderEnumToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :gender, default: 0, null: false
    end
  end
end
