require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validation" do
    context "valid attributes" do
      subject { build(:comment, report: create(:report)) }

      it { should be_valid }
    end

    context "missing report_id" do
      subject { build(:comment, report_id: nil) }

      it { should be_invalid }
    end

    context "missing content" do
      subject { build(:comment, report: create(:report), content: nil) }

      it { should be_invalid }
    end
  end
end
