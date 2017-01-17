class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.datetime :starting_at, null: false
      t.datetime :ending_at, null: false
      t.belongs_to :event

      t.timestamps
    end
  end
end
