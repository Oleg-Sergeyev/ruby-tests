# frozen_string_literal: true

RSpec::Expectations.configuration.on_potential_false_positives = :nothing
RSpec.shared_examples 'UserData' do |user|
  context 'Инициализация корректными данными работает', :lesson do
    it 'для русско-язычного пользователя' do
      expect { user.new generate(:ru) }.not_to raise_error(UserConstructed::Error)
    end
    it 'для англо-язычного пользователя' do
      expect { user.new generate(:eng) }.not_to raise_error(UserConstructed::Error)
    end
  end
  context 'Инициализация некорректными данными вызывает ошибку', :lesson do
    it 'для русско-язычного пользователя' do
      %i[email first_name last_name middle_name].each do |key|
        expect { user.new(generate(:ru, key => :wrong)) }.to raise_error(UserConstructed::Error)
      end
    end
    it 'для англо-язычного пользователя' do
      %i[email first_name last_name].each do |key|
        expect { user.new(generate(:eng, key => :wrong)) }.to raise_error(UserConstructed::Error)
      end
    end
  end
end
