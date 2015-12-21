class AddCityAndCountryToReport < ActiveRecord::Migration
  def change
    add_column :reports, :city, :string
    add_column :reports, :country, :string
  end
end
