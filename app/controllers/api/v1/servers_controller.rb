class Api::V1::ServersController < Api::V1::BaseController
	# /api/v1/servers(.:format)
	def index
		@servers = current_user.servers
		respond_with(@servers)
	end

	# GET    /api/v1/servers/:id(.:format)
	def show
		@server = current_user.servers.find(params[:id])
		respond_with(@server)
	end

	# POST   /api/v1/servers(.:format)
	def create
		@server = Server.new(params[:server])
		@server.save
		respond_with(@server)
	end

	# PUT    /api/v1/servers/:id(.:format)
	def update
		@server = current_user.servers.find(params[:id])
		@server.update_attributes(params[:server])
		respond_with(@server)
	end

	# DELETE /api/v1/servers/:id(.:format)
	def destroy
		@server = current_user.servers.find(params[:id])
		@server.destroy
		respond_with(@server)
	end
end
