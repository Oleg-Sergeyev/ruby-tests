# frozen_string_literal: true

require 'rspec/expectations'

RSpec::Matchers.define :be_unique do
  match do |actual|
    actual.to_a.uniq.length == actual.length
  end
end

RSpec::Matchers.define :be_email do
  match do |actual|
    actual.match(/^\S+@\S+\.\S+$/)
  end
end

RSpec::Matchers.define :be_cyrillic do
  match do |actual|
    actual.match(/^[а-яА-ЯёЁ]+/)
  end
end

RSpec::Matchers.define :be_latin do
  match do |actual|
    actual.match(/^[a-zA-Z]+/)
  end
end
# negation
RSpec::Matchers.define_negated_matcher :not_email, :be_email
RSpec::Matchers.define_negated_matcher :not_cyrillic, :be_cyrillic
RSpec::Matchers.define_negated_matcher :not_latin, :be_latin
