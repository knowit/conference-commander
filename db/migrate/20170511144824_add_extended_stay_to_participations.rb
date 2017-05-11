class AddExtendedStayToParticipations < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :extended_stay, :boolean
    add_column :participations, :extended_stay_from, :date
    add_column :participations, :extended_stay_to, :date
  end
end
