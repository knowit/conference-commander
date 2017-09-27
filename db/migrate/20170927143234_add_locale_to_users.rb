class AddLocaleToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :locale, null: false, default: :en
    end

    User.update_all(locale: :nb)
  end
end
