class AdminController < ApplicationController
  before_filter :authenticate_user!, :check_admin

  private

  def check_admin
    redirect_to root_path unless current_user.has_role? :admin
  end
end
