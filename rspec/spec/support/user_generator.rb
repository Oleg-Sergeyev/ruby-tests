# frozen_string_literal: true

require 'ffaker'

# module UserGenerator
module UserGenerator
  def generate(national, error = nil)
    user = national == :ru ? cirilyc_names : latin_names
    user.update({ email: FFaker::Internet.safe_email })
    user.update({ error.keys.first => FFaker::Time.date.to_s }) if error && error[error.keys.first] == :wrong
    [user, national]
  end

  def cirilyc_names
    { first_name: FFaker::NameRU.first_name,
      last_name: FFaker::NameRU.last_name,
      middle_name: FFaker::NameRU.send("middle_name_#{%w[male female].sample}") }
  end

  def latin_names
    { first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      middle_name: nil }
  end
end
