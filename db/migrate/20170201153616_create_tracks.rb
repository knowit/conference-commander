class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
