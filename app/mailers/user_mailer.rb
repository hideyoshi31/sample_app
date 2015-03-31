class UserMailer < ActionMailer::Base
  default from: "hashimotobulog@gmail.com"
  
  def submit_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Posted contcts', bcc: 'hashimotobulog@gmail.com' )
  end
end