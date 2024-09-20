class CreateBikes < ActiveRecord::Migration[7.2]
  def change
    create_table :bikes do |t|
      t.string :manufacturer
      t.string :model
      t.integer :horsepower
      t.integer :weight
      t.integer :year
      t.integer :mileage
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
