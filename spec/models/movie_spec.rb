require 'rails_helper'

RSpec.describe Movie do
  let!(:movie) { FactoryBot.create(:movie)}

  context "associations" do
    it{should have_many :comments}
    it{should have_many :schedules}
  end

  context "validations" do
    it{should validate_presence_of :name}
    it{should validate_presence_of :description}
    it{should validate_presence_of :time}
  end

  context "scope" do
    it "sort by newest" do
      Movie.sort_by_newest.should eq [movie]
    end

    it "search_by_name" do
      Movie.search_by_name("tieng").should eq [movie]
    end
  end
end
