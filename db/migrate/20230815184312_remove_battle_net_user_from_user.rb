class RemoveBattleNetUserFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :battle_net_user, :string
  end
end
