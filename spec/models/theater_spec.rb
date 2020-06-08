require 'rails_helper'

RSpec.describe Theater do
  let!(:theater) { FactoryBot.create(:theater)}

  context "associations" do
    it{should have_many :rooms}
  end

  context "scope" do
    it "sort by newest" do
      Theater.sort.should eq [theater]
    end
  end
end
