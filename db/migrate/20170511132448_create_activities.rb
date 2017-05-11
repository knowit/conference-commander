class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.text :title, null: false
      t.text :description, null: false

      t.references :event, index: true, null: false

      t.timestamps
    end
  end
end
