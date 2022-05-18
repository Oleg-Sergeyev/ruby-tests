# frozen_string_literal: true

require 'ffaker'

# module UserGenerator
module UserGenerator
  def generate(national, error = nil)
    user = create(national)
    if error && error[error.keys.first] == :wrong
      any_string = [FFaker::Time.date.to_s, FFaker::InternetSE.ip_v4_address.to_s].sample
      user.update({ error.keys.first => any_string })
    end
    [user, national]
  end

  def create(national)
    klass = national == :ru ? :NameRU : :Name
    hash = { first_name: FFaker.const_get(klass).first_name,
             last_name: FFaker.const_get(klass).last_name,
             middle_name: nil,
             email: FFaker::Internet.safe_email }
    if klass == :NameRU
      method = "middle_name_#{%w[male female].sample}"
      hash.update({ middle_name: FFaker.const_get(klass).send(method) })
    end
    hash
  end
end
