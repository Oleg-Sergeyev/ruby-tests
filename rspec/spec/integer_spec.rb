# frozen_string_literal: true

#require_relative '../../lib/services/integer_converter'

RSpec.describe "Сервис объект #{Services::IntegerConverter}" do
  let(:test_value) { convert_by_integer_converter(5_000_000) }
  let(:correct_value) { convert_by_tester(5_000_000) }

  it 'выводит в результате hash вида {kb: xxx.xx}' do
    expect(generate).to respond_to :keys
  end
  it 'конвертация провелась корректно' do
    expect(test_value).to eq correct_value
  end
  it 'конвертирует заданное число в мегабайты' do
    expect(test_value[:mb]).to eq correct_value[:mb]
  end
  xit 'конвертирует заданное число в байты' do
    expect(test_value[:bytes]).to eq correct_value[:bytes]
  end
end
