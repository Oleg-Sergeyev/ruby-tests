# frozen_string_literal: true

class UserException < StandardError
end

# module UserConstructed
module UserConstructed
  def initialize(hash)
    check_value(hash)
    hash.each { |k, v| public_send("#{k}=", v) }
  end

  def check_value(hash)
    unless hash[:email].match?(/^\S+@\S+\.\S+$/)
      raise UserException, "Поле email содержит некорректный электронный адрес '#{hash[:email]}'"
    end
    # unless hash[:first_name].match?(/^[а-яА-ЯёЁ]+/)
    #   raise UserException, "Поле first_name содержит некорректное имя '#{hash[:firts_name]}'"
    # end
  rescue UserException => e
    puts e.message.to_s
  end
end
