class Contact < BaseForm
  attribute :name, String
  attribute :email, String
  attribute :query, String

  validates :name, presence: true, length: { minimum: 4, maximum: 200 }
  validates :query, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :email, presence: true, email_format: true

  def persisted?
    false
  end
end
