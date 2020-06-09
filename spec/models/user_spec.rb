require 'rails_helper'

RSpec.describe User do
  let!(:user) { FactoryBot.create(:user)}
  let!(:user1) { FactoryBot.create(:user)}

  context "associations" do
    it{should have_many :comments}
    it{should have_many :bookings}
  end

  context "validations" do
    it{should validate_presence_of :name}
    it{should validate_presence_of :email}
    it{should validate_length_of(:name).is_at_most(Settings.user.name.maximum)}
  end

  context "scope" do
    it "sort by newest" do
      User.sort_by_newest.should eq [user1,user]
    end
  end
end
