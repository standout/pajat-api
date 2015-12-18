class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :agent
      t.string :agent_ip

      t.timestamps null: false
    end
  end
end
