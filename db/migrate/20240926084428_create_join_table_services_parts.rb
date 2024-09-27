class CreateJoinTableServicesParts < ActiveRecord::Migration[7.2]
  def change
    create_join_table :services, :parts do |t|
      t.index :service_id
      t.index :part_id
    end
  end
end
