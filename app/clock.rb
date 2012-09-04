# require 'config/boot'
# require 'config/environment'
require 'delayed_job_active_record'
require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
  Delayed::Job.enqueue ServerStatusJob.new
end

every(1.minutes, 'serverstatus.update')