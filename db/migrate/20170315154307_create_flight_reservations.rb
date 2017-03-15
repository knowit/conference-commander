class CreateFlightReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :flight_reservations do |t|
      t.datetime :travel_date, null: true
      t.string :flight_number, null: true
      t.references :flights, foreign_key: true, null: true
      t.references :participations, foreign_key: true, null: false
      t.references :events, foreign_key: true, null: false
      t.timestamps
    end
  end
end
