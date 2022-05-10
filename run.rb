def convert_by_tester(value)
  range = (1...999)
  hash = { bytes: (value.to_f / 1).round(2),
           kb: (value.to_f / 1024).round(2),
           mb: (value.to_f / 1024**2).round(2),
           gb: (value.to_f / 1024**3).round(2),
           pt: (value.to_f / 1024**3).round(2) }
  hash.select { |k, v| { k.to_sym => v } if range.include?(v) }
end

p convert_by_tester(5_000_000)