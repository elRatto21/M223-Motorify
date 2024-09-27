class User < ApplicationRecord
  has_paper_trail
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email format" }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :password, presence: true, length: { minimum: 12 }, if: -> { new_record? || !password.nil? }
  
  belongs_to :team, optional: true
  enum role: { member: 0, teamleader: 1, admin: 2 }
end
