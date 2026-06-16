class User < ApplicationRecord
  # Validations
  validates :name, :DOB, :phone_number, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
