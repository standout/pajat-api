require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST create' do
    it 'creates a comment' do
      expect { post_create_comment }.to change { Comment.count }
      expect(json.keys).to eq %w(
        id report_id content agent agent_ip commenter_network commenter_username
        created_at updated_at
      )
      expect(json["id"]).to be_a Fixnum
      expect(json["report_id"]).to be_a Fixnum
      expect(json["agent"]).to eq "Albot 1.0"
      expect(json["agent_ip"]).to eq nil
      expect(json["commenter_network"]).to eq "Twitter"
      expect(json["commenter_username"]).to eq "albertarv"
      expect(json["content"]).to eq "Fixed!"
      expect(json["created_at"]).to match(valid_date_matcher)
    end
  end

  def json
    response.body && JSON.parse(response.body)
  end

  def valid_date_matcher
    /\d+-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z/
  end

  def post_create_comment
    post :create,
      report_id: create(:report).id,
      comment: attributes_for(:comment)
  end
end
