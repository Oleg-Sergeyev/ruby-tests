# frozen_string_literal: true

# module UserConstructed
module UserConstructed
  def initialize(hash)
    hash.each { |k, v| public_send("#{k}=", v) }
  end
end
