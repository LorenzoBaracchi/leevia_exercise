require 'spec_helper'

require_relative '../app/collection.rb'
require_relative '../app/city.rb'

RSpec.describe Collection do

  describe '#group' do
    let(:cities) {described_class.new([
      City.new(name: 'Potenza', country: 'Italy', altitude: 698.0),
      City.new(name: 'Rome', country: 'Italy', altitude: 14.0),
      City.new(name: 'Seaforth', country: 'Jamaica', altitude: 127),
      City.new(name: 'Port Royal', country: 'Jamaica', altitude: -9999.0)
      ])}

    subject {cities.group(:country)}

    it 'should group cities by county' do
      expect(subject.keys).to match_array ['Italy', 'Jamaica']
      expect(subject['Italy'].map(&:name)).to match_array ['Potenza', 'Rome']
      expect(subject['Jamaica'].map(&:name)).to match_array ['Seaforth', 'Port Royal']
    end
  end

end
