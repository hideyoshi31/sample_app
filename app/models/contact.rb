class Contact < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }
end
