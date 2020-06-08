require 'rails_helper'

RSpec.describe Room do
  context "associations" do
    it{should belong_to :theater}
    it{should have_many :seats}
    it{should have_many :schedules}
  end
end
