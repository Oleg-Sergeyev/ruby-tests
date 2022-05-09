# frozen_string_literal: true

require_relative '../../lib/services/integer_converter'

RSpec.describe Services::IntegerConverter do
  context 'Сервис объект IntegerConverter' do
    # let(:value) {5_000_000}
    let(:test_value) { convert_by_integer_converter(5_000_000) }
    let(:correct_value) { convert_by_tester(5_000_000) }

    it 'выводит в результате hash вида {kb: xxx.xx}' do
      expect(test_value.respond_to?(:keys)).to eq true
    end
    it 'конвертация провелась корректно' do
      expect(test_value).to eq correct_value
      # p "#{value} в #{test_value.values.first} #{test_value.keys.first}"
    end
    it 'конвертирует заданное число в мегабайты' do
      expect(test_value[:mb]).to eq correct_value[:mb]
    end
    xit 'конвертирует заданное число в байты' do
      expect(test_value[:bytes]).to eq correct_value[:bytes]
    end
  end
end
