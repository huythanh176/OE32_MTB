class AddParamsStatusTransactionIdPurchasedAtToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :notification_params, :text
    add_column :bookings, :status, :string
    add_column :bookings, :transaction_id, :string
    add_column :bookings, :purchased_at, :datetime
  end
end
