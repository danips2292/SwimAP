class User::ChatController < ApplicationController
	layout 'layouts/_user_partial'
	before_action :confirm_logged_in
  before_action :validates_user_access
  def index
  end
end
