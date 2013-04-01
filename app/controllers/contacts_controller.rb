class ContactsController < ApplicationController
  before_filter :authenticate_user!
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.all


  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = current_user.contacts.find(params[:id])

  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = current_user.contacts.new

  end

  # GET /contacts/1/edit
  def edit
    @contact = current_user.contacts.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = current_user.contacts.new(params[:contact])

      if @contact.save
        redirect_to @contact, notice: 'Contact was successfully created.'  
      else
        render action: "new" 
      end
    
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = current_user.contacts.find(params[:id])

      if @contact.update_attributes(params[:contact])
        redirect_to @contact, notice: 'Contact was successfully updated.'
      else
        render action: "edit"
      end
    
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = current_user.contacts.find(params[:id])
    @contact.destroy

    redirect_to contacts_url
    
  end
end
