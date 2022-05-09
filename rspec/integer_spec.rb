# frozen_string_literal: true

require_relative '../lib/services/integer_converter'

RSpec.describe Services::IntegerConverter do
  context 'Сервис объект IntegerConverter' do
    before do
      @value = 5_000_000
      @dimension = { bytes: (@alue.to_f / 1).round(2),
                     kb: (@value.to_f / 1024).round(2),
                     mb: (@value.to_f / 1024**2).round(2),
                     gb: (@value.to_f / 1024**3).round(2),
                     pt: (@value.to_f / 1024**3).round(2) }
      @correct = @dimension.map { |k, v| { k.to_sym => v } if (1...999).include?(v) }.compact.first
    end

    def convert
      Services::IntegerConverter.resize(@value)
    end

    it 'выводит в результате hash вида {kb: xxx.xx}' do
      expect(convert.respond_to?(:keys)).to eq true
    end

    it 'конвертация провелась корректно' do
      expect(convert).to eq @correct
      p "#{@value} в #{@correct.values.first} #{@correct.keys.first}"
    end

    # xit 'конвертирует заданное число в байты' do
    #   expect(convert[:bytes]).to eq @dimension[:bytes]
    # end
    it 'конвертирует заданное число в мегабайты' do
      expect(convert[:mb]).to eq @dimension[:mb]
    end
  end
end
