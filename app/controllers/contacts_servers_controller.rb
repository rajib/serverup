class ContactsServersController < ApplicationController
    before_filter :authenticate_user!
  
  def assign
    @server = Server.find(params[:server_id])
    @contact = Contact.find(params[:hidden_id])
    @server.contacts << @contact
    @server.save
    redirect_to server_contacts_path(params[:server_id]), notice:'The Mail ID was successfully added'
  end
end
