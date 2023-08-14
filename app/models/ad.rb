class Ad < ApplicationRecord
  belongs_to :game_mode

  enum platform: { battle_net: 1, steam: 2 }
  enum favorite_classes: { damage: 1, tank: 2, support: 3 }

  validates :platform_indentification, uniqueness: true
  validates :platform, :platform_indentification, presence: true
  validates :years_playing, :hour_start, :hour_end, numericality: { only_integer: true }

  def hour_start=(string_value)
    self[:hour_start] = hours_to_minutes(string_value)
  end

  def hour_end=(string_value)
    self[:hour_end] = hours_to_minutes(string_value)
  end

  private

  def hours_to_minutes(value)
    hour, minutes = value.split(':').map(&:to_i)
    (hour * 60) + minutes
  end
end
