class RemoveGameModeFromAds < ActiveRecord::Migration[7.0]
  def change
    remove_column :ads, :game_mode, :integer
  end
end
