require 'rails_helper'

RSpec.describe BookingDetail do
  let!(:user) { FactoryBot.create(:user)}
  let!(:promotion) { FactoryBot.create(:promotion)}
  let!(:payment) { FactoryBot.create(:payment)}
  let!(:movie) { FactoryBot.create(:movie)}
  let!(:theater) { FactoryBot.create(:theater)}
  let!(:room) { FactoryBot.create(:room)}
  let!(:seat) { FactoryBot.create(:seat)}
  let!(:schedule) { FactoryBot.create(:schedule)}
  let!(:booking) { FactoryBot.create(:booking)}
  let!(:booking_detail) { FactoryBot.create(:booking_detail)}


  context "associations" do
    it{should belong_to :booking}
    it{should belong_to :seat}
  end

  context "scope" do
    it "sort by newest" do
      BookingDetail.sort_by_newest.should eq [booking_detail]
    end

    it "get seat booked by schedule" do
      BookingDetail.get_seat_booked_by_schedule(schedule.id).should eq [seat.id]
    end
  end
end

