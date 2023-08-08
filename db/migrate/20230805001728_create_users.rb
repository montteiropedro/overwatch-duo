class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :provider
      t.string :discord_id
      t.string :battle_net_user
      t.string :steam_code

      t.timestamps
    end

    add_index :users, :discord_id, unique: true
    add_index :users, :battle_net_user, unique: true
    add_index :users, :steam_code, unique: true
  end
end
