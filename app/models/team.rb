class Team < ApplicationRecord
    has_paper_trail

    validates :name, presence: true
end
