# frozen_string_literal: true

require_relative '../lib/services/week_days'

RSpec.describe Services::WeekDays do
  context 'Сервис объект WeekDays' do
    def generate
      Services::WeekDays.generate
    end

    it 'является хеш-объектом' do
      expect(generate.respond_to?(:keys)).to eq true
    end

    it 'содержит общее количество дней - 7' do
      expect(generate.count).to eq 7
    end

    it 'можно получить значение по ключу, например hash[:monday]' do
      expect(generate[:monday]).to eq 'понедельник'
      expect(generate[:tuesday]).to eq 'вторник'
    end
  end
end
