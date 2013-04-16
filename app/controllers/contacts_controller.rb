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
    @contact = current_user.contacts.new(name:params[:name], email:params[:email])
    @contact = current_user.contacts.new(params[:contact])
    @server_id = params[:server_id].to_i
    @contact.save
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = current_user.contacts.find(params[:id])


      if @contact.update_attributes(params[:contact])
         @contacts = current_user.contacts.all.reverse
         respond_to do |format|
           format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
           format.js
         end        
      else
        render action: "edit"
      end
    
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = current_user.contacts.find(params[:id])
    @contact.destroy
    @contacts = current_user.contacts.all.reverse

    @server_id = params[:server_id].to_i
    if @server_id
      respond_to do |format|
        format.html { redirect_to contacts_url }
        format.js
      end   
    else
     redirect_to contacts_url
    end 
    
  end
end
