# frozen_string_literal: true

# module UserConstructed
module UserConstructed
  class Error < RuntimeError; end

  def initialize(array)
    user = array.first
    national =  array.last
    user.each { |k, v| public_send("#{k}=", v) } if check_value(user, national)
  end

  def check_value(user, national)
    unless email_correct?(user[:email])
      raise Error, "Инициализации пользователя некорректным электронным адресом #{user[:email]}"
    end
    if national == :ru && !include_cirilyc_chars?(user)
      raise Error, 'Инициализации русского пользователя некорректными символами'
    end
    if national == :eng && !include_latin_chars?(user)
      raise Error, 'Инициализации английского пользователя некорректными символами'
    end

    true
  end

  def email_correct?(email)
    return true if /^\S+@\S+\.\S+$/.match? email
  end

  def include_cirilyc_chars?(user)
    %i[first_name last_name middle_name].each do |value|
      return false unless /^[а-яА-ЯёЁ]+/.match? user[value]
    end
    true
  end

  def include_latin_chars?(user)
    %i[first_name last_name].each do |value|
      return false unless /^[a-zA-Z]+/.match? user[value]
    end
    true
  end
end
