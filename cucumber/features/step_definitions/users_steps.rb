# frozen_string_literal: true

require_relative '../../../lib/user'
# require_relative '../../../lib/services/user_generator'

Допустим(/^дан объект класса User$/) do
  # @some_user = Services::UserGenerator.generate
  # @user = User.new(@some_user)
  @user = User.new(
    email: 'test@test.ru',
    first_name: 'Тест',
    last_name: 'Тестов',
    middle_name: 'Тестович'
  )
end

Если('я вызываю его метод email') do
  @email = @user.email
end

То(/^получаю электронный адрес '([^']*)'$/) do |str|
  raise unless @email == str
end

Если('я вызываю его метод first_name') do
  @first_name = @user.first_name
end

То(/^получаю имя '([^']*)'$/) do |str|
  raise unless @first_name == str
end

Если('я вызываю его метод last_name') do
  @last_name = @user.last_name
end

То(/^получаю фамилию '([^']*)'$/) do |str|
  raise unless @last_name == str
end

Если('я вызываю его метод middle_name') do
  @middle_name = @user.middle_name
end

То(/^получаю отчество '([^']*)'$/) do |str|
  raise unless @middle_name == str
end

def parse_str(string); end
