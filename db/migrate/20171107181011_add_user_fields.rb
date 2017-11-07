class AddUserFields < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :mobile
      t.string :company
    end
  end
end
