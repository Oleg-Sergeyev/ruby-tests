# frozen_string_literal: true

RSpec.shared_examples 'PlanetMethods' do |store_class|
  let(:solar_system) { store_class.new }
  let(:planets) { %i[mercury venus earth mars jupiter saturn uranus neptune pluto] }
  context 'содержит все методы/планеты', :lesson do
    it :planets do
      planets.each do |method|
        expect(solar_system).respond_to? method
      end
    end
  end
end
