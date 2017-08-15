class AddLongitudeAndLatidetudeToHotel < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :lat
    remove_column :hotels, :lon

    add_column :hotels, :latitude, :float
    add_column :hotels, :longitude, :float
  end
end
