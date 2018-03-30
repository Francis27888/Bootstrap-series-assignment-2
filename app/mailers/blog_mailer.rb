class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog=blog
    mail(to: @blog.email,subject:"Blog created successfully!!!!")
  end
end
