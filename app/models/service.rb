class Service < ApplicationRecord
  has_paper_trail
  has_and_belongs_to_many :parts

  belongs_to :bike
  belongs_to :team

  validates :title, :bike_id, :team_id, presence: true
end
