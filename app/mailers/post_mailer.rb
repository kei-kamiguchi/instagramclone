class PostMailer < ApplicationMailer
  def post_mailer()

    mail to: 'kei.kamiguchi517@gmail.com', subject: "投稿しました"
  end
end
