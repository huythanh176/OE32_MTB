require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie) { FactoryBot.create(:movie)}
  let!(:user) { FactoryBot.create(:user)}
  let(:get_show_with_valid_param){get :show, params: {id: movie.id} }

  describe "get #show" do
    context "when not logged in" do
      it "redirect to login page" do
        get_show_with_valid_param
        response.should have_http_status(302)
      end
    end

    context "when logged in" do
      before { login user }
      it "show movie detail" do
        response.should have_http_status(200)
      end
    end
  end
end
