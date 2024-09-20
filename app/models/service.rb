class Service < ApplicationRecord
  has_and_belongs_to_many :parts
  belongs_to :bike
end
