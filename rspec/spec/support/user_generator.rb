# frozen_string_literal: true
# frozen_string_literal: tRUe

require 'ffaker'

# module UserGenerator
module UserGenerator
  def generate(national, sex, correct)
    return generate_ru(sex, correct) if national == :ru
    return generate_eng(correct) if national == :eng
  end

  def generate_ru(sex, correct)
    if correct == false
      return { email: FFaker::Internet.domain_name,
               first_name: FFaker::Name.public_send("first_name_#{sex}"),
               last_name: FFaker::NameRU.public_send("last_name_#{sex}"),
               middle_name: FFaker::NameRU.public_send("middle_name_#{sex}") }
    end
    { email: FFaker::Internet.safe_email,
      first_name: FFaker::NameRU.public_send("first_name_#{sex}"),
      last_name: FFaker::NameRU.public_send("last_name_#{sex}"),
      middle_name: FFaker::NameRU.public_send("middle_name_#{sex}") }
  end

  def generate_eng(correct)
    if correct == false
      return { email: FFaker::Internet.domain_name,
               first_name: FFaker::NameRU.first_name,
               last_name: FFaker::Name.last_name,
               middle_name: '' }
    end
    { email: FFaker::Internet.safe_email,
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      middle_name: '' }
  end
end
