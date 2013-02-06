require 'net/http'

class LinkStatus
  def initialize(link)
    @link = link
  end

  def status
    begin
      url = URI.parse(@link)
      Net::HTTP.start(url.host, url.port) do |http|
        status_code = http.head(url.request_uri).code
        return status_code.to_i
      end
    rescue SocketError => error
      return 404
    rescue StandardError => error
      return 404
    end
  end
end
