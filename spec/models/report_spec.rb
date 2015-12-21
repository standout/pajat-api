require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'creation' do
    it 'can be created' do
      r = Report.new valid_attributes
      expect(r).to be_valid
    end

    it 'needs a latitude' do
      r = Report.new valid_attributes
      r.latitude = nil
      expect(r.valid?).to be false
    end

    it 'needs a description' do
      r = Report.new valid_attributes
      r.description = nil
      expect(r.valid?).to be false
    end

    it 'gets an address' do
      r = Report.create! valid_attributes
      expect(r.city).to eq("Växjö")
      expect(r.country).to eq("Sweden")
    end
  end

  def valid_attributes
    {
      latitude: 56.878333,
      longitude: 14.809167,
      description: 'Test'
    }
  end
end
