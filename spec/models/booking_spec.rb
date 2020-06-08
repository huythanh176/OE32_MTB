require 'rails_helper'

RSpec.describe Booking do
  let!(:user) { FactoryBot.create(:user)}
  let!(:promotion) { FactoryBot.create(:promotion)}
  let!(:payment) { FactoryBot.create(:payment)}
  let!(:movie) { FactoryBot.create(:movie)}
  let!(:theater) { FactoryBot.create(:theater)}
  let!(:room) { FactoryBot.create(:room)}
  let!(:schedule) { FactoryBot.create(:schedule)}
  let!(:booking) { FactoryBot.create(:booking)}


  context "associations" do
    it{should belong_to :user}
    it{should belong_to :payment}
    it{should belong_to :schedule}
    it{should belong_to :promotion}
    it{should have_many :booking_details}
  end

  context "scope" do
    it "sort by newest" do
      Booking.sort_by_newest.should eq [booking]
    end
  end
end
