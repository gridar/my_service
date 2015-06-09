class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def htaccess_staging
    if Rails.env.staging?
      authenticate_or_request_with_http_basic do |username, password|
        username == 'my_service' && password == 'my_servicetymate'
      end
    end
  end
end
