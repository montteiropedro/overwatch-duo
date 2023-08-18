class AddUserRankToAd < ActiveRecord::Migration[7.0]
  def change
    add_column :ads, :user_rank, :integer, default: 1
  end
end
