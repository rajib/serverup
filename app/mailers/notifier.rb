class Notifier < ActionMailer::Base
  default from: "admin@serverup.com"

  def down_email(user, server)
   	@user = user
   	logger.info "=====user================#{user.inspect}"
    @server = server
    mail(:to => user.email, :subject => "Server Status Notification")
  end

  def up_email(user, server)
   	@user = user
   	logger.info "=====user================#{user.inspect}"
    @server = server
    mail(:to => user.email, :subject => "Server Status Notification")
  end

end
