class AdminController < ApplicationController 
  layout 'layouts/_admin_partial'
  before_action :confirm_logged_in
  before_action :validates_admin_access
  def index
  end
end
