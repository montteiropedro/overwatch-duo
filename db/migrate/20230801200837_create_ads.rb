class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.integer :game_mode, null: false
      t.integer :platform, null: false
      t.string :platform_indentification, null: false
      t.integer :years_playing
      t.integer :favorite_classes
      t.integer :hour_start
      t.integer :hour_end
      t.boolean :voice_channel, default: false

      t.timestamps
    end
  end
end
