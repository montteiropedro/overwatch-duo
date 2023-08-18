class AddDiscordUserToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :discord_user, :string, null: false
    add_index :users, :discord_user, unique: true
  end
end
