class AddExtraAttributesToReport < ActiveRecord::Migration
  def change
    add_column :reports, :reporter_network, :string
    add_column :reports, :reporter_username, :string
    add_column :reports, :source_url, :string
    add_column :reports, :image_url, :string
  end
end
