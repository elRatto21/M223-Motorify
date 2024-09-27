class Bike < ApplicationRecord
  has_paper_trail
  belongs_to :team

  validates :manufacturer, :model, presence: true
end
