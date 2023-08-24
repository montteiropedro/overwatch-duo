require 'rails_helper'

RSpec.describe GameMode, type: :model do
  describe '#valid?' do
    context 'name' do
      it 'não deve estar em branco' do
        game_mode = GameMode.new(name: '')

        game_mode.valid?

        expect(game_mode.errors.include?(:name)).to eq true
        expect(game_mode.errors[:name].include?('não pode ficar em branco')).to eq true
      end
    end
  end
end
