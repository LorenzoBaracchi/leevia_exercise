require 'spec_helper'

require_relative '../app/city.rb'

RSpec.describe City do

  describe '#to_s' do
    subject {described_class.new(name: 'Potenza', country: 'Italy', altitude: 698.0).to_s}

    it {is_expected.to eq('698m - Potenza, Italy')}
  end

  describe "#<=>" do
    subject {city1 <=> city2}

    context 'when greater altitude' do
      let(:city1) {described_class.new(name: 'Potenza', country: 'Italy', altitude: 698.0)}
      let(:city2) {described_class.new(name: 'Laredo', country: 'United States', altitude: 115.0)}

      it {is_expected.to eq 1}
    end

    context 'when less altitude' do
      let(:city1) {described_class.new(name: 'Laredo', country: 'United States', altitude: 115.0)}
      let(:city2) {described_class.new(name: 'Potenza', country: 'Italy', altitude: 698.0)}

      it {is_expected.to eq -1}
    end

    context 'when equal altitude' do
      let(:city1) {described_class.new(name: 'Laredo', country: 'United States', altitude: 115.0)}
      let(:city2) {described_class.new(name: 'Laredo', country: 'United States', altitude: 115.0)}

      it {is_expected.to eq 0}
    end
  end

end
