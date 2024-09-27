class JoinTableServicesParts < ApplicationRecord
  has_paper_trail
  self.table_name = "jointable_services_parts"

  belongs_to :service
  belongs_to :part
end
