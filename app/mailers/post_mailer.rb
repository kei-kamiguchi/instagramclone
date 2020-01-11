class PostMailer < ApplicationMailer
  def post_mailer(current_user.email)

    mail to: "current_user.email", subject: "投稿しました"
  end
end
