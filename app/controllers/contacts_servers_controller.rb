class ContactsServersController < ApplicationController
    before_filter :authenticate_user!
  
  def assign
    @server = Server.find(params[:server_id])
    @contact = Contact.find(params[:hidden_id])
    @server.contacts << @contact
    @server.save

    respond_to do |format|
       format.html 
       format.js 
    end
  end
end
