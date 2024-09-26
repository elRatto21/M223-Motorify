class User < ApplicationRecord
  has_paper_trail
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  belongs_to :team, optional: true
  enum role: { member: 0, teamleader: 1, admin: 2 }
end
