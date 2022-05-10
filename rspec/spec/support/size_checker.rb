# frozen_string_literal: true

# module SizeChecker
module SizeChecker
  BYTES = 1_024
  RANGE = (1...999).freeze
  def convert_by_integer_converter(value)
    Services::IntegerConverter.resize(value)
  end

  def convert_by_tester(value)
    hash = { bytes: (value.to_f / 1).round(2),
             kb: (value.to_f / BYTES).round(2),
             mb: (value.to_f / BYTES**2).round(2),
             gb: (value.to_f / BYTES**3).round(2),
             pt: (value.to_f / BYTES**3).round(2) }
    hash.select { |k, v| { k.to_sym => v } if RANGE.include?(v) }
  end
end
