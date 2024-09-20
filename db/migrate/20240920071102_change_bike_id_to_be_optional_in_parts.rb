class ChangeBikeIdToBeOptionalInParts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :parts, :bike_id, true
  end
end
