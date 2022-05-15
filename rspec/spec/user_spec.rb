# frozen_string_literal: true

require_relative '../../lib/user'

RSpec.describe User do
  let(:user_ru) { described_class.new(generate(:ru, :male, true)) }
  let(:user_eng) { described_class.new(generate(:eng, nil, true)) }
  let(:user_ru_fault) { described_class.new(generate(:ru, :male, false)) }
  let(:user_eng_fault) { described_class.new(generate(:eng, nil, false)) }
  it_behaves_like 'UserMethods', User

  context 'Созданный пользователь RU содержит корректный', :lesson do
    it 'электронный адрес' do
      expect(user_ru.email).to be_email
    end
    it 'имя' do
      expect(user_ru.first_name).to be_cyrillic
    end
  end
  context 'Пользователь Eng содержит корректный', :lesson do
    it 'электронный адрес' do
      expect(user_eng.email).to be_email
    end
    it 'имя' do
      expect(user_eng.first_name).to be_latin
    end
  end
  context 'Пользователь RU_FAULT содержит', :lesson do
    it 'некорректный электронный адрес!' do
      expect(user_ru_fault.email).to not_email
      # expect(user_eng_fault.first_name).to raise_error('Некорректный электронный адрес!')
    end
    it 'некорректное имя!' do
      expect(user_ru_fault.first_name).to not_cyrillic
      # expect(user_eng_fault.first_name).to raise_error('Некорректное имя!')
    end
  end
  context 'Пользователь Eng_FAULT содержит', :lesson do
    it 'некорректный электронный адрес!' do
      expect(user_eng_fault.email).to not_email
      # expect(user_eng_fault.email).to raise_error('Некорректный электронный адрес!')
    end
    it 'некорректное имя!' do
      expect(user_eng_fault.first_name).to not_latin
    end
  end
end
