class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_EMAIL']
  layout 'mailer'

  def send_welcome_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to StonX")
  end

  def send_approved_email(user)
    @user = user
    mail(:to => @user.email, :subject => "Your account has been approved!")
  end
end
