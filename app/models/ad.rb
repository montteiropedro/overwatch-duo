class Ad < ApplicationRecord
  enum game_mode: { unranked: 1, competitive: 2, arcade: 3, custom_game: 4 }
  enum platform: { battle_net: 1, steam: 2 }
  enum favorite_classes: { damage: 1, tank: 2, support: 3 }

  validates :platform_indentification, uniqueness: true
  validates :game_mode, :platform, :platform_indentification, presence: true
  validates :years_playing, :hour_start, :hour_end, numericality: { only_integer: true }
end
