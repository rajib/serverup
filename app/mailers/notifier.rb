class Notifier < ActionMailer::Base
  default from: "indusnet.testacc@gmail.com"

  def notification_email(user, server)
   	@user = user
   	logger.info "=====user================#{user.inspect}"
    @server = server
    mail(:to => user.email, :subject => "Server Status Notification")
  end

end
