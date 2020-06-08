class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  belongs_to :promotion
  has_many :booking_details, dependent: :destroy
  scope :sort_by_newest, -> { order created_at: :desc }

  def paypal_url(return_path)
    values = {
        business: "sb-5w1pg2227265@business.example.com",
        cmd: "_xclick",
        upload: 1,
        return: "https://3d91bc4199d3.ngrok.io#{return_path}",
        invoice: id,
        amount: 2,
        item_name: "s",
        item_number: 1,
        quantity: '1'
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
