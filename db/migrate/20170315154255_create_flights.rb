class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :airline, null: false
      t.string :from, null: false
      t.string :destination, null: false
      t.string :flight_number, null: false
      t.integer :direction, null: false
      t.datetime :travel_date, null: false
      t.date :change_reservation_before, null: true
      t.references :event, foreign_key: true, null: false
      t.timestamps
    end
  end
end


