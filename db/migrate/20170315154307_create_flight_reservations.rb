class CreateFlightReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :flight_reservations do |t|
      t.datetime :travel_date, null: true
      t.string :flight_number, null: true
      t.references :flight, foreign_key: true, null: true
      t.references :participation, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false
      t.timestamps
    end
  end
end
