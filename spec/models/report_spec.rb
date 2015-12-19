require 'rails_helper'

RSpec.describe Report, type: :model do
  describe "validation" do
    context "valid attributes" do
      subject { build(:report) }

      it { should be_valid }
    end

    context "missing latitude" do
      subject { build(:report, latitude: nil) }

      it { should be_invalid }
    end

    context "missing description" do
      subject { build(:report, description: nil) }

      it { should be_invalid }
    end
  end
end
