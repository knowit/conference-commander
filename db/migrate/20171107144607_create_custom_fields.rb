class CreateCustomFields < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_fields do |t|
      t.references :customizable, polymorphic: true, null: false
      t.string :name, null: false
      t.string :data_type, null: false
    end
  end
end
