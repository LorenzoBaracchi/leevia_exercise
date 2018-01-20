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

  describe 'extract_highest' do
    let(:cities) {Collection.new([
      City.new(name: 'Varese', country: 'Italy', altitude: 390.0),
      City.new(name: 'Potenza', country: 'Italy', altitude: 698.0),
      City.new(name: 'Rome', country: 'Italy', altitude: 14.0),
      City.new(name: 'Seaforth', country: 'Jamaica', altitude: 127),
      City.new(name: 'Port Royal', country: 'Jamaica', altitude: -9999.0)])}

      it 'should extract highest city for each county' do
        expect(Main.extract_highest(cities).map(&:name)).to eq ['Potenza', 'Seaforth']
      end
  end

end
