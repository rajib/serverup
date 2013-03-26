class Notifier < ActionMailer::Base
  default from: "admin@serverup.com"

  def down_email(recipients, server)
   	@recipients = recipients
    @server = server
    mail(:to => @recipients.join(','), :subject => "Server Status Notification")
  end

  def up_email(user, server)
   	@recipients = recipients
    @server = server
    mail(:to => @recipients.join(','), :subject => "Server Status Notification")
  end

end
