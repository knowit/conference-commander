class AddRequestForSingleroomToParticipations < ActiveRecord::Migration[5.0]
  def change
    change_table :participations do |t|
      t.text :request_for_single_room, null: true
    end

  end
end
