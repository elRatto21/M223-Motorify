class AddTeamIdToServices < ActiveRecord::Migration[7.2]
  def change
    add_column :services, :team_id, :integer
    add_foreign_key :services, :teams
  end
end
