# frozen_string_literal: true

module Services
  # class IntegerConverter
  class IntegerConverter
    BYTES = 1_024
    CONV_HASH = { BYTES: 1, kb: BYTES, mb: BYTES**2, gb: BYTES**3, tb: BYTES**4, pt: BYTES**5 }.freeze
    def self.resize(value)
      CONV_HASH.to_a.reverse.to_h.each do |k, v|
        s = (value.to_f / v).round(2)
        return Hash[k, s] if (1...999).include?(s)
      end
    end
  end
end
