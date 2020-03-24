class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, notice: exception.message }
    end
  end
end
