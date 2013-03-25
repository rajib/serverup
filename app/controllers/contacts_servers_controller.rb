class ContactsServersController < ApplicationController
	before_filter :authenticate_user!
  def assign
  	@server = Server.find(params[:server_id])
  	@contact = Contact.find(params[:id])
  	@server.users << @contact
  	@server.save
  end
end
