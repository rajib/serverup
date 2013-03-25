class ServerHistory < ActiveRecord::Base
  attr_accessible :server_id, :status

  def self.last_status(server_id)
  	status = ServerHistory.where('server_id=?',server_id).last!
  	return status.status
  rescue                    # This will handle if record not found
  	var = "no_record"
    return var
  end
end
