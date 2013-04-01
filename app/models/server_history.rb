class ServerHistory < ActiveRecord::Base
  attr_accessible :server_id, :status

  def self.last_status(server_id)
    status = ServerHistory.where('server_id=?',server_id).last!
    return status.status
  rescue                    # This will handle if record not found
    var = "no_record"
    return var
  end

  def self.downtime(server)
    previous_time = ServerHistory.where('server_id=? AND status=?',server.id,server.status).last!
    previous_time = previous_time.created_at
    
    current_time = Server.where('id=?',server.id).last!
    current_time = current_time.updated_at
    
    downtime = ((current_time.to_time - previous_time.to_time)/60).to_i
    
    return downtime
  
  end


end
