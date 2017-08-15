class MovePassportInformation < ActiveRecord::Migration[5.1]
  def self.up
    User.all.each do |u|
      u.create_passport(
        first_name: u.passport_first_name,
        last_name: u.passport_last_name,
        number: u.passport_number,
        nationality: u.passport_nationality,
        issued_at: u.passport_issued_at,
        expires_at: u.passport_expires_at
      )
    end
  end

  def self.down
    User.all.each do |u|
      u.passport.destroy
    end
  end
end
