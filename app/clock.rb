require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

module Clockwork
	handler do |job|
	  puts "Running #{job}"
	end

	every(5.minutes, 'serverstatus.update') {
		Server.update_statuses
		# Server.server_notification_mail
	}
end
