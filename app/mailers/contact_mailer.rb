class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact=contact
    mail to:"to",subject:"subject"
  end
end
