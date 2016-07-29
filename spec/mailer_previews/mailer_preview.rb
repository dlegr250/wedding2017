class MailerPreview < ActionMailer::Preview
  def invitation_email
    object = User.last
    Mailer.invitation_email(object)
  end

  def password_reset_email
    object = User.last
    object.password_reset_token = ::Modules::Generator.random_token
    Mailer.password_reset_email(object)
  end
end
