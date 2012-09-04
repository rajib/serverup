class ServerStatusJob
	def perform
		Server.update_statuses
	end
end