class Part < ApplicationRecord
  has_and_belongs_to_many :services
  belongs_to :bike, optional: true
  belongs_to :team
end
