require 'rails_helper'

RSpec.describe Schedule do
  let!(:theater) { FactoryBot.create(:theater)}
  let!(:movie) { FactoryBot.create(:movie)}
  let!(:room) { FactoryBot.create(:room)}
  let!(:schedule) { FactoryBot.create(:schedule)}


  context "associations" do
    it{should belong_to :movie}
    it{should belong_to :room}
    it{should have_many :bookings}
  end

  context "scope" do
    it "sort by newest" do
      Schedule.sort_by_newest.should eq [schedule]
    end

    it "get schedule by day" do
      Schedule.get_schedule_by_day("8-4-2020 22:30").should eq [schedule]
    end

    it "get schedule by theater" do
      Schedule.get_schedule_by_theater(theater.id).should eq [schedule]
    end
  end
end
