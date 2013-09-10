class ContactMailer < ActionMailer::Base
  def send_message(contact)
    @contact = contact
    mail(to: emails, subject: 'Formulario de contacto', from: contact.email)
  end

  private
    def emails
      %w(pablo@bonsaierp.com boris@bonsaierp.com contacto@bonsaierp.com)
    end
end
