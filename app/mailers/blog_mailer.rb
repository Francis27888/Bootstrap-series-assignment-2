class BlogMailer < ApplicationMailer
  def blog_mail(blog,user)
    @blog=blog
    @user=user
    mail(to: @user.email,subject:"Blog created successfully!!!!")
  end
end
