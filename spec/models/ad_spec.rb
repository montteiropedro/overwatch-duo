require 'rails_helper'

RSpec.describe Ad, type: :model do
  describe '#valid?' do
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

      it 'deve transformar de horas/minutos pra apenas minutos' do
        ad1 = Ad.new(hour_start: '18:00')
        ad2 = Ad.new(hour_start: '18:30')

        expect(ad1.hour_start).not_to eq '18:00'
        expect(ad1.hour_start).to eq 1080
        expect(ad2.hour_start).not_to eq '18:30'
        expect(ad2.hour_start).to eq 1110
      end
    end

    context 'hour_end' do
      it 'deve ser um número' do
        ad = Ad.new(hour_end: '')

        ad.valid?

        expect(ad.errors.include?(:hour_end)).to eq true
        expect(ad.errors[:hour_end].include?('não é um número')).to eq true
      end

      it 'deve transformar de horas/minutos pra apenas minutos' do
        ad1 = Ad.new(hour_end: '18:00')
        ad2 = Ad.new(hour_end: '18:30')

        expect(ad1.hour_end).not_to eq '18:00'
        expect(ad1.hour_end).to eq 1080
        expect(ad2.hour_end).not_to eq '18:30'
        expect(ad2.hour_end).to eq 1110
      end
    end
  end
end
