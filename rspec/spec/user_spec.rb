# frozen_string_literal: true

RSpec.describe User do
  let(:user_ru) { described_class.new generate(:ru) }
  let(:user_eng) { described_class.new generate(:eng) }

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
  context 'Создаваемый пользователь RU_FAULT содержит', :lesson do
    it 'некорректный электронный адрес!' do
      expect { described_class.new(generate(:ru, { email: :wrong })) }.to raise_error(UserConstructed::Error)
    end
    it 'некорректное имя!' do
      expect { described_class.new(generate(:ru, { first_name: :wrong })) }.to raise_error(UserConstructed::Error)
    end
  end
  context 'Создаваемый пользователь Eng_FAULT содержит', :lesson do
    it 'некорректный электронный адрес!' do
      expect { described_class.new(generate(:eng, { email: :wrong })) }.to raise_error(UserConstructed::Error)
    end
    it 'некорректное имя!' do
      expect { described_class.new(generate(:eng, { first_name: :wrong })) }.to raise_error(UserConstructed::Error)
    end
  end
end
