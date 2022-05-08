# frozen_string_literal: true

require_relative 'lib/user'

user1 = User.new(
                  email: 'test@test.ru',
                  first_name: 'Тест',
                  last_name: 'Тестов',
                  middle_name: 'Тестович' )

puts "user = #{user1}"
puts "name = #{User.generate}"
