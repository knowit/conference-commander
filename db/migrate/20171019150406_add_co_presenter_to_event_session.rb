class AddCoPresenterToEventSession < ActiveRecord::Migration[5.1]
  def change
    change_table :event_sessions do |t|
      t.string :co_presenters
      t.string :comments_to_organizers
    end
  end
end
