require 'spec_helper'

require_relative '../app/city.rb'
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

end
