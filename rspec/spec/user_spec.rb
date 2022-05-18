# frozen_string_literal: true

RSpec.describe User do
  let(:user_ru) { described_class.new generate(:ru) }
  let(:user_eng) { described_class.new generate(:eng) }
  ############## auto tests ################
  it_behaves_like 'UserMethods', User
  it_behaves_like 'UserData', User
  ##########################################
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
end
