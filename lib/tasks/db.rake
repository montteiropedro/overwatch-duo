namespace :db do
  desc 'Insert overwatch 2 game modes inside the database'
  task gamemode: :environment do
    %w[unranked competitive arcade custom_game].each { |gamemode| GameMode.create!(name: gamemode) }
  end

  task reset: :environment do
    %w[unranked competitive arcade custom_game].each { |gamemode| GameMode.create!(name: gamemode) }
  end
end
