class AddUuidToAds < ActiveRecord::Migration[7.0]
  def change
    remove_column :ads, :id
    add_column :ads, :id, :uuid, default: 'gen_random_uuid()', null: false
    execute 'ALTER TABLE ads ADD PRIMARY KEY (id);'
  end
end
