class PostMailer < ApplicationMailer
  def post_mail(@post)

    mail to: User.find_by(id: @post.user_id).email , subject: "投稿しました"
  end
end
