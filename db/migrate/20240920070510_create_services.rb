class CreateServices < ActiveRecord::Migration[7.2]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.references :bike, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
