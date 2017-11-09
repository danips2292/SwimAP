class Team::FormController < ApplicationController
	layout 'layouts/_team_partial'
  before_action :confirm_logged_in
  before_action :validates_team_access
  
  def index
  	@form = TeamForm.where(:user_id => session[:user_id].to_s).first
  	if @form.nil?
  		@form = TeamForm.new({:user_id => session[:user_id]})
      @form.save
  	end

  end

  def register
  	@form = TeamForm.where(:user_id => session[:user_id].to_s).first
  	if @form.update(team_form_paramas)
  		flash[:notice] = "Formulario Actualizado Correctamente"
  		redirect_to team_form_index_path
  	else
  		flash[:notice] = "Error, intente de nuevo"
  		render ('index')
  	end

  end


  private 

  def team_form_paramas
  	params.require(:team_form).permit(:user_id, :career,
												:gender,
												:local_id,
												:passport_id,
												:tec_id,
												:birth_date,
												:weight_kg,
												:height_cm,
												:age,
												:blood_type,
												:right_handed,
												:emergency_contact_name,
												:local_id_receiver,
												:relation_type,
												:last_edition_national_games,
												:last_edition_university_team,
												:las_edition_national_team,
												:city_of_origin,
												:residence_location)
  end

end
