# frozen_string_literal: true

require 'faker'

# class User
class User
  attr_reader :email, :first_name, :last_name, :middle_name

  def initialize(email:, first_name:, last_name:, middle_name:)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @middle_name = middle_name
  end

  def self.generate
    { email: Faker::Internet.safe_email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      middle_name: Faker::Name.middle_name }
  end
end
