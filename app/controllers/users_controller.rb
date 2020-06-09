class UsersController < ApplicationController
  before_action :user_signed_in?, only: %i(edit update show)

  def show; end
end
