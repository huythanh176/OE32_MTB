require 'rails_helper'

RSpec.describe Seat do
  let!(:theater) { FactoryBot.create(:theater)}
  let(:room1) { FactoryBot.create(:room)}
  let(:room2) { FactoryBot.create(:room)}
  let(:seat) { FactoryBot.create(:seat)}


  context "associations" do
    it{should belong_to :room}
    it{should have_many :booking_details}
  end

  context "scope" do
    it "get_seats_by_room" do
      Seat.get_seats_by_room(room1.id).should eq [seat]
    end
  end
end
