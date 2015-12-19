class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :report, index: true, foreign_key: true
      t.text :content
      t.string :agent
      t.string :agent_ip
      t.string :commenter_network
      t.string :commenter_username
      t.string :old_status
      t.string :new_status

      t.timestamps null: false
    end
  end
end
