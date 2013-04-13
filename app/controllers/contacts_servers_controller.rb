class ContactsServersController < ApplicationController
    before_filter :authenticate_user!
  
  def create
    @server = Server.find(params[:server_id])
    @contact = current_user.contacts.new(params[:contact])
    if @contact.save
      @server.contacts << @contact
      @server.save
      respond_to do |format|
         format.js 
      end      
    end

  end

  def destroy
   @server = Server.find(params[:server_id]) 
   @contactsserver = ContactsServer.find_by_server_id_and_contact_id(params[:server_id],params[:id])
   @contactsserver.destroy
   respond_to do |f|
      f.js
   end
  end

  def update
    @server = Server.find(params[:server_id])
    @contact = Contact.find(params[:id])
    @server.contacts << @contact
    @server.save
    respond_to do |format|
      format.js
    end
  end
end
