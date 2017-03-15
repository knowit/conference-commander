class AddEventIdToHotels < ActiveRecord::Migration[5.1]
  def change
    change_table :hotels do |t|
      t.references :event
    end
  end
end
