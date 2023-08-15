class RemoveSteamCodeFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :steam_code, :string
  end
end
