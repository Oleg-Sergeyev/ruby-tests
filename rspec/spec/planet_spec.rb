# frozen_string_literal: true

require_relative '../../lib/solar_system'

RSpec.describe SolarSystem do
  let(:solar_system) { described_class.new }
  it_behaves_like 'PlanetMethods', SolarSystem

  context 'Объект Cолнечная система', :lesson do
    it 'содержит 9 планет' do
      expect(solar_system.size).to eq 9
    end
    it 'планета марс существует и ее значение 4' do
      expect(solar_system).respond_to? :mars
      expect(solar_system.mars).to eq 4
    end
    it 'принимает блок each' do
      expect { |block| solar_system.each(&block) }.to yield_control
    end
    it 'можно трансформировать в hash' do
      expect(solar_system).respond_to? :to_h
    end
    it 'значение в hash[:earth] соотвствует 3' do
      expect(solar_system.to_h[:earth]).to eq 3
    end
    describe 'при обращении к несуществующей планете moon' do
      it 'срабатывает исключение' do
        expect { solar_system.moon }.to raise_error('Не существующая планета!')
      end
    end
  end
end
