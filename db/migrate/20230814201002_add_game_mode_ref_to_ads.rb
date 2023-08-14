class AddGameModeRefToAds < ActiveRecord::Migration[7.0]
  def change
    add_reference :ads, :game_mode, type: :uuid, null: false, foreign_key: true
  end
end
