require 'rails_helper'

RSpec.describe Report, type: :model do

  describe 'creation' do
    it 'can be created' do
      r = Report.new valid_attributes
      expect(r.valid?).to be true
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
  end

  def valid_attributes
    {
      latitude: 12.4,
      longitude: 85.2,
      description: 'Test'
    }
  end
end