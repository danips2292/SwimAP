class User::AssistancesController < ApplicationController
	layout 'layouts/_user_partial'
	#before_action :confirm_logged_in
    #before_action :validates_user_access
  def index
   @total_true = 0
    @user = User.find(session[:user_id])
    @group_id = @user.group_id
  	@assistancesGroup = Assistance.byGroupId(@group_id.to_i)
  end
end
