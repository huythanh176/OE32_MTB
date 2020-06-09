class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.references :user, foreign_key: true
      t.references :schedule, foreign_key: true
      t.references :promotion, foreign_key: true

      t.timestamps
    end
  end
end
