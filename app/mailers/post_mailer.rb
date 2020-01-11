class PostMailer < ApplicationMailer
  def post_mail(current_user.email)

    mail to: current_user.email, subject: "投稿しました"
  end
end
