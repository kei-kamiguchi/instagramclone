class PostMailer < ApplicationMailer
  def post_mail(item)

    mail to: "item", subject: "投稿しました"
  end
end
