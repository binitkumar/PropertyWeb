class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_user_language

  def set_user_language
    I18n.config.enforce_available_locales = false
    cookies[:language] = "zh-CN".to_sym if cookies[:language].blank?
    I18n.locale = cookies[:language] || "zh-CN".to_sym
  end
end
