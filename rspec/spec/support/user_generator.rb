# frozen_string_literal: true

require 'ffaker'

# module UserGenerator
module UserGenerator
  def generate(national, error = nil)
    user = national == :ru ? names(:NameRU) : names(:Name)
    user.update({ error.keys.first => FFaker::Time.date.to_s }) if error && error[error.keys.first] == :wrong
    [user, national]
  end

  def names(national)
    hash = { first_name: FFaker.const_get(national).first_name,
             last_name: FFaker.const_get(national).last_name,
             middle_name: nil,
             email: FFaker::Internet.safe_email }
    hash.update({ middle_name: FFaker::NameRU.send("middle_name_#{%w[male female].sample}") }) if national == :NameRU
    hash
  end
end
