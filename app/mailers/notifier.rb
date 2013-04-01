class Notifier < ActionMailer::Base
  default from: "alert@serverup.com"

  def down_email(recipients, server)
    @recipients = recipients
    @server = server
    mail(:to => @recipients.join(','), :subject => "DOWN Alert: "+@server.name+" is DOWN")
  end

  def up_email(recipients, server, downtime)
    @recipients = recipients
    @server = server
    @downtime = downtime
    mail(:to => @recipients.join(','), :subject => "UP Alert: "+@server.name+" is UP")
  end

end
