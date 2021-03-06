class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => '您没有权限访问此页面。'
  end
  protect_from_forgery with: :exception
  include Consul::Controller
  current_power do
    Power.new(current_user||User.new)
  end
end
