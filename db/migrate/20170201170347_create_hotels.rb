class CreateHotels < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :address
      t.string :country
      t.float :lat
      t.float :lon
      t.timestamps null: true
    end
  end
end
