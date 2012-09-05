require 'daemons'
require 'clockwork'

clock_path = File.join(File.expand_path(File.dirname(__FILE__)), 'clock.rb')

Daemons.run_proc('clockwork') do
  STDERR.sync = STDOUT.sync = true
  require clock_path

  trap('INT') do
    puts "\rExiting"
    exit
  end

  Clockwork::run
end