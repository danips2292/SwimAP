class Admin::AssistancesController < ApplicationController
    layout 'layouts/_admin_partial'
    before_action :set_assistance, only: [:show]
    before_action :confirm_logged_in
    before_action :validates_admin_access
 

    def index
        @assistances = Assistance.all
        group_id = params[:group_id]
        if params[:group_id]
            @assistances = Assistance.search(group_id).order("name DESC")
        else
            @assistances = Assistance.all.order('name DESC')
        end    
    end

    def show
        @assistance = Assistance.find(params[:id])
    end

    def info_student()
        id_assistance = params[:assistance]
        lista= AssistancesUser.where(assistance_id: id_assistance)
        @students = []
        lista.each do |fs|
            @students.push(User.where(id: fs.user_id).first)
        end          
    end
    
end
