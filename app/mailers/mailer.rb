class Mailer < ApplicationMailer
  def invitation_email(user)
    @user = user
    mail(to: @user.email, subject: "Invitation to join")
  end

  def password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: "Password reset instructions")
  end
end
