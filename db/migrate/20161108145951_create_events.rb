class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.datetime :starting_at, null: false
      t.datetime :ending_at, null: false

      t.timestamps
    end
  end
end
