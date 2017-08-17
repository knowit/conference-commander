class CreateLocks < ActiveRecord::Migration[5.1]
  def change
    create_table :locks do |t|
      t.references :lockable, polymorphic: true
      t.text :field
      t.date :locked_at

      t.timestamps
    end

    add_index :locks, [:lockable_type, :lockable_id, :field]
  end
end


