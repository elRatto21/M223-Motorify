class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :role
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
