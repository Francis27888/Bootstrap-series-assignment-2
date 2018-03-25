class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact=contact
    mail(to: @contact.email,subject:"subject")
  end
end
