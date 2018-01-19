require 'spec_helper'

require_relative '../app/city.rb'

RSpec.describe City do

  describe '#to_s' do
    subject {described_class.new(name: 'Potenza', country: 'Italy', altitude: 698.0).to_s}

    it {is_expected.to eq('698m - Potenza, Italy')}
  end

end
