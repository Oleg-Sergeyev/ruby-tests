# frozen_string_literal: true

# module SizeChecker
module SizeChecker
  def convert_by_integer_converter(value)
    Services::IntegerConverter.resize(value)
  end

  def convert_by_tester(value)
    hash = { bytes: (value.to_f / 1).round(2),
             kb: (value.to_f / 1024).round(2),
             mb: (value.to_f / 1024**2).round(2),
             gb: (value.to_f / 1024**3).round(2),
             pt: (value.to_f / 1024**3).round(2) }
    hash.map { |k, v| { k.to_sym => v } if (1...999).include?(v) }.compact.first
  end
end
