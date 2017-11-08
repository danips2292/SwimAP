class UserController < ApplicationController
	layout 'layouts/_user_partial'
  def index 

  end 

  def fillForm
  	@form = InitialForm.where(:user_id => session[:user_id].to_s).first
  	if @form.nil?
  		@form = InitialForm.new({:user_id => session[:user_id]})
      @form.save
  	end
  end

  def register
  	@form = InitialForm.where(:user_id => session[:user_id].to_s).first
  	if @form.update(form_params)
  		flash[:notice] = "Formulario Actualizado Correctamente"
  		redirect_to user_fillForm_path
  	else
  		flash[:notice] = "Error, intente de nuevo"
  		render ('index')
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
