class ContactUsMailer < ApplicationMailer
  default from: 'Kandang Ayam<do-not-reply@kandangayam.id>'

  def notification_user(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => contact.email, :subject => contact.subject)
  end

  def notification_officer(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "kandangayamid@gmail.com", :subject => "[Kandang Ayam Admin] #{contact.subject}")
  end

  def notification_admin(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "martin.me15@yahoo.com", :subject => "[Kandang Ayam] #{contact.subject}")
  end
end
