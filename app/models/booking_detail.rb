class BookingDetail < ApplicationRecord
  belongs_to :booking
  belongs_to :seat
  scope :sort_by_newest, -> {order created_at: :desc}
  scope :get_seat_booked_by_schedule, -> (schedule_id){BookingDetail.joins(booking: :schedule)
                                               .where(schedules: {id:schedule_id})
                                               .pluck(:seat_id)}

  def purchase
    response = EXPRESS_GATEWAY.purchase(1, express_purchase_options)
    # cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  private

  def express_purchase_options
    {
      :ip => ip,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
end
