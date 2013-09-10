class Contact
  include Virtus
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :name, String
  attribute :email, String
  attribute :query, String

  validates :name, presence: true, length: { minimum: 4, maximum: 200 }
  validates :query, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :email, presence: true, email: true

  def persisted?
    false
  end
end
