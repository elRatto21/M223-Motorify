class CreateJointableServicesParts < ActiveRecord::Migration[7.2]
  def change
    create_table :jointable_services_parts do |t|
      t.references :service, foreign_key: true
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
