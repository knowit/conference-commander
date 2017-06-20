class AddLocaleToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :locale, :integer, :default => 0, :null => false
  end
end
