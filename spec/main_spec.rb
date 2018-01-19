require 'spec_helper'

require_relative '../app/main.rb'

RSpec.describe Main do

  describe '.csv_to_city' do
    let(:csv_line) {["1", "Afghanistan", "Kabul", "34.5166667", "69.1833344", "1808.0"]}

    subject {Main.csv_to_city(csv_line)}

    it 'should convert a csv line to a city' do
      expect(subject.name).to eq('Kabul')
      expect(subject.country).to eq('Afghanistan')
      expect(subject.altitude).to eq(1808)
    end
  end

  describe 'group_by' do
    let(:cities) {[
      City.new(name: 'Potenza', country: 'Italy', altitude: 698.0),
      City.new(name: 'Rome', country: 'Italy', altitude: 14.0),
      City.new(name: 'Seaforth', country: 'Jamaica', altitude: 127),
      City.new(name: 'Port Royal', country: 'Jamaica', altitude: -9999.0),
      ]}

    subject {Main.group_by(cities, :country)}

    it 'should group cities by county' do
      expect(subject.keys).to match_array ['Italy', 'Jamaica']
      expect(subject['Italy'].map(&:name)).to match_array ['Potenza', 'Rome']
      expect(subject['Jamaica'].map(&:name)).to match_array ['Seaforth', 'Port Royal']
    end
  end
end
