require 'rails_helper'

RSpec.describe Comment do
  let!(:user) { FactoryBot.create(:user)}
  let!(:movie) { FactoryBot.create(:movie)}
  let!(:comment) { FactoryBot.create(:comment)}

  context "associations" do
    it{should belong_to :user}
    it{should belong_to :movie}
  end

  context "scope" do
    it "sort by newest" do
      Comment.sort_by_newest.should eq [comment]
    end
  end
end
