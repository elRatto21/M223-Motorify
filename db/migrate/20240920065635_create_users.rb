class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :password_confirmation
      t.string :role
      t.references :team, null: true, foreign_key: true

      t.timestamps
    end
  end
end
