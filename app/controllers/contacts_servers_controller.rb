class ContactsServersController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
  def assign
  	@server = Server.find(params[:server_id])
  	@contact = Contact.find(params[:id])
  	@server.contacts << @contact
  	@server.save
  end
end
