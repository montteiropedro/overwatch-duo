class Ad < ApplicationRecord
  enum game_mode: { unrunked: 1, competitive: 2, arcade: 3, custom_game: 4 }
  enum platform: { battle_net: 1, steam: 2 }
  enum favorite_classes: { damage: 1, tank: 2, support: 3 }
end
