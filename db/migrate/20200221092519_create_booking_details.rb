class CreateBookingDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_details do |t|
      t.references :booking, foreign_key: true
      t.references :seat, foreign_key: true

      t.timestamps
    end
  end
end
