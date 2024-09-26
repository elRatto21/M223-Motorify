class Part < ApplicationRecord
  has_paper_trail
  has_and_belongs_to_many :services

  belongs_to :team
  belongs_to :bike, optional: true
end
