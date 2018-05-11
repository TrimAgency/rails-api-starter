class ConsumerMailer < BaseMandrillMailer
  default from: 'no_reply@vibiio.com'
  layout 'mailer'

  def password_reset(user_id, jwt)
    user = User.find(user_id)
    token = jwt
    role = user.profile_type
    email = user.email
    merge_vars = {
      'RESET_LINK' => "#{ENV['EMAIL_ORIGIN']}/password-reset?token=#{token}&role=#{role}"
    }

    body = mandrill_template('password-reset', merge_vars)
    send_mail(email, 'Your Password Reset is Here', body)
  end
end