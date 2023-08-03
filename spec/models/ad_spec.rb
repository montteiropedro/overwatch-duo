require 'rails_helper'

RSpec.describe Ad, type: :model do
  describe '#valid?' do
    context 'game_mode' do
      it 'não deve estar em branco' do
        ad = Ad.new(game_mode: '')

        ad.valid?

        expect(ad.errors.include?(:game_mode)).to eq true
        expect(ad.errors[:game_mode].include?('não pode ficar em branco')).to eq true
      end
    end

    context 'platform' do
      it 'não deve estar em branco' do
        ad = Ad.new(platform: '')

        ad.valid?

        expect(ad.errors.include?(:platform)).to eq true
        expect(ad.errors[:platform].include?('não pode ficar em branco')).to eq true
      end
    end

    context 'platform_indentification' do
      it 'não deve estar em branco' do
        ad = Ad.new(platform_indentification: '')

        ad.valid?

        expect(ad.errors.include?(:platform_indentification)).to eq true
        expect(ad.errors[:platform_indentification].include?('não pode ficar em branco')).to eq true
      end

      it 'deve ser único' do
        Ad.create!(platform_indentification: 'PlayerNumberOne',
                   game_mode: :unranked, platform: :battle_net,
                   years_playing: 7, favorite_classes: :tank,
                   hour_start: 360, hour_end: 480, voice_channel: true)
        ad = Ad.new(platform_indentification: 'PlayerNumberOne')

        ad.valid?

        expect(ad.errors.include?(:platform_indentification)).to eq true
        expect(ad.errors[:platform_indentification].include?('já está em uso')).to eq true
      end
    end

    context 'years_playing' do
      it 'deve ser um número' do
        ad = Ad.new(years_playing: '')

        ad.valid?

        expect(ad.errors.include?(:years_playing)).to eq true
        expect(ad.errors[:years_playing].include?('não é um número')).to eq true
      end
    end

    context 'hour_start' do
      it 'deve ser um número' do
        ad = Ad.new(hour_start: '')

        ad.valid?

        expect(ad.errors.include?(:hour_start)).to eq true
        expect(ad.errors[:hour_start].include?('não é um número')).to eq true
      end
    end

    context 'hour_end' do
      it 'deve ser um número' do
        ad = Ad.new(hour_end: '')

        ad.valid?

        expect(ad.errors.include?(:hour_end)).to eq true
        expect(ad.errors[:hour_end].include?('não é um número')).to eq true
      end
    end
  end
end
