class ContactController < ApplicationController
  # POST /contact
  def create
    contact = Contact.new(contact_params)

    if contact.valid?
      ContactMailerJob.new.async.perform(contact)

      render json: {success: true}
     else
       render json: contact.errors
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:email, :name, :query)
    end
end
