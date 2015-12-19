class Comment < ActiveRecord::Base
  belongs_to :report

  validates :report_id, presence: true
  validates :content, presence: true
  validates :agent, presence: true
  validates :agent_ip, presence: true
  validates :commenter_network, presence: true
  validates :commenter_username, presence: true
  validates :new_status, presence: true
end
