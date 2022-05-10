# frozen_string_literal: true

require 'faker'

# module UserGenerator
module UserGenerator
  def generate
    { email: Faker::Internet.safe_email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      middle_name: Faker::Name.middle_name }
  end
end
