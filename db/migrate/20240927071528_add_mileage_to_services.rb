class AddMileageToServices < ActiveRecord::Migration[7.2]
  def change
    add_column :services, :mileage, :integer
  end
end
