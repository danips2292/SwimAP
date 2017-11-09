class User::PendingController < ApplicationController
	layout 'layouts/_login'
	before_action :confirm_logged_in
  before_action :validates_user_access
  def index
  end
end
