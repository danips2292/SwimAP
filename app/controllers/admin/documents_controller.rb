class Admin::DocumentsController < ApplicationController
  layout 'layouts/_admin_partial'
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  # GET /documents/new
  def new
    @groups = Group.all
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    doc_attributes = doc_params
    users_send_email = User.get_users_by_groups(doc_attributes[:group_id])
    @document = Document.new(doc_params)
     if @document.save
        users_send_email.each do |user|
          #UserMailer.new_post(user.email).deliver
        end
      redirect_to admin_documents_path
     else
      render 'new'
     end   
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    @document = Document.find(params[:id])
    
    if @document.update(doc_params)
      redirect_to admin_documents_path
    else
      render 'edit'
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])  
    @document.destroy 
    redirect_to admin_documents_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:document).permit(:title, :text, :group_id)
    end
end
