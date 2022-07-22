# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    #user 変数にUser.firstを代入
    user = User.first
    #user.activation_token に User.new_tokenを代入
    user.activation_token = User.new_token
    #UserMailer.account_activationメソッドの引数をuserにする
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    UserMailer.password_reset
  end

end
