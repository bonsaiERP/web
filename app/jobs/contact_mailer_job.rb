class ContactMailerJob
  include SuckerPunch::Job

  def perform(contact)
    ContactMailer.send_message(contact).deliver!
  end
end
