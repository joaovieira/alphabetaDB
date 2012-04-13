class ApplicationController < ActionController::Base

  protect_from_forgery

  helper_method :unicode_to_string

  before_filter :set_locale, :add_home_breadcrumbs

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # app/controllers/application_controller.rb
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def add_home_breadcrumbs
    add_breadcrumb I18n.t("home.self"), :root_path
  end

  def unicode_to_string unicode
    array = unicode.split(' ')
    packed = ""
    array.each do |u|
      packed += [u.hex].pack('U')
    end

    return packed
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    :back
  end

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    request.env["HTTP_REFERER"]
  end
end
