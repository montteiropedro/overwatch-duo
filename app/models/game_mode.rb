class GameMode < ApplicationRecord
  has_many :ads, dependent: :restrict_with_exception

  validates :name, presence: true
end
