class CreateJointableServicesParts < ActiveRecord::Migration[7.2]
  def change
    create_table :jointable_services_parts do |t|
      t.string :service
      t.string :part

      t.timestamps
    end
  end
end
