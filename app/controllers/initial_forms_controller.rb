class InitialFormsController < ApplicationController
	layout 'layouts/content_partial'
  def register
  	@form = InitialForm.new(form_params)
  	if @form.save== false
      	flash[:error] = @movie.errors.full_messages.join(', ')
      	render('fillForm')
    else
    	@user = User.where(email: current_user.email).first
    	@form.user_id = @user.id
    	redirect_to(:controller => 'user' , :action => 'index')

    end

  end


  def form_params
		params.require(:initial_form).permit(:legal_id, 
			:tec_id, :name, :carreer, :start_year, :gender,
			 :birth_date, :workplace, :study_address, :father_name, 
			 :mother_name, :home_address, :accident_name, 
			 :accident_telephone, :accident_comment, :accident_address, 
			 :team_history, :team_accomplishments, :semester, :current_year,
			 :height_cm, :weight, :doctor_name, :blood_type, :deasease, 
			 :hospitalized, :surgery, :meds, :vitamins, :allergies, 
			 :bruises, :faints, :dizziness, :chestpain, :headeache, 
			 :cholesterol, :heart_studies, :heartattack_related, 
			 :skin_problems, :concussion, :memory_loss, :convulsions, 
			 :tingles, :cough, :eye_problems, :sprains, :diabetes, 
			 :pregnant)
	end

end
