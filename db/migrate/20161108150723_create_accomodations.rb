class CreateAccomodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accomodations do |t|
      t.integer :number_of_beds

      t.timestamps
    end
  end
end
