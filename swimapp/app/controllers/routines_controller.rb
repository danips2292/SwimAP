class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  # GET /routines
  # GET /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1
  # GET /routines/1.json
  def show
    @routine = Routine.find(params[:id])
  end

  # GET /routines/new
  def new
    @routine = Routine.new
  end

  # GET /routines/1/edit
  def edit
    @routine = Routine.find(params[:id])
  end

  # POST /routines
  # POST /routines.json
  def create
    @routine = Routine.new(routine_params)
    
     if @routine.save
      redirect_to @routine
     else
      render 'new'
     end   
  end

  # PATCH/PUT /routines/1
  # PATCH/PUT /routines/1.json
  def update
    @routine = Routine.find(params[:id])
    
    if @routine.update(routine_params)
      redirect_to @routine
    else
      render 'edit'
    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy
    @routine = Routine.find(params[:id])  
    @routine.destroy 
    redirect_to routines_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_params
      params.require(:routine).permit(:distance, :description)
    end
end
