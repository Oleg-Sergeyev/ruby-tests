# frozen_string_literal: true

RSpec.describe "Сервис объект #{Services::IntegerConverter}", :lesson do
  let(:test_value) { convert_by_integer_converter(5_000_000) }
  let(:correct_value) { convert_by_tester(5_000_000) }

  it 'выводит в результате hash вида {kb: xxx.xx}' do
    expect(test_value).to respond_to :keys
  end
  it 'конвертация провелась корректно' do
    expect(test_value).to eq correct_value
  end
  it 'конвертирует заданное число в мегабайты' do
    expect(test_value[:mb]).to eq correct_value[:mb]
  end
  it 'конвертирует заданное число в байты' do
    expect(test_value[:bytes]).to eq correct_value[:bytes]
  end
end
