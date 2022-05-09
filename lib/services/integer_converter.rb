# frozen_string_literal: true

module Services
  # class IntegerConverter
  class IntegerConverter
    def self.resize(value)
      bytes = 1024
      hash = { bytes: 1, kb: bytes, mb: bytes**2, gb: bytes**3, tb: bytes**4, pt: bytes**5 }
      hash.to_a.reverse.to_h.each do |k, v|
        s = (value.to_f / v).round(2)
        return Hash[k, s] if (1...999).include?(s)
      end
    end
  end
end
