class AddColumnIsPublishedToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_published, :bool, default: false, null: false
  end
end
