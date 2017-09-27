class AddDescriptionToHotel < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :description, :string
  end
end
