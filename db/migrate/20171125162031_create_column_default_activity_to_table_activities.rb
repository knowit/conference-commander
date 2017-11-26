class CreateColumnDefaultActivityToTableActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :default_activity, :bool, default: false, null: false
  end
end
