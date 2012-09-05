Clockwork.configure do |config|
  config[:sleep_timeout] = 5
  config[:logger] = Logger.new(File.expand_path('../../../log/clockwork.log', __FILE__))
end