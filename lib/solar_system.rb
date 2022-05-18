# frozen_string_literal: true

# class NotExistingPlanetException
class NotExistingPlanetException < RuntimeError
end

# class SolarSystem
class SolarSystem
  include Enumerable

  PLANTES = { mercury: 1,
              venus: 2,
              earth: 3,
              mars: 4,
              jupiter: 5,
              saturn: 6,
              uranus: 7,
              neptune: 8,
              pluto: 9 }.freeze
  def initialize
    PLANTES.each do |key, _val|
      self.class.send(:define_method, key) { PLANTES[key] }
    end
  end

  # "Планеты '#{method}' в солнечной системе не существует!"
  def method_missing(_method, *_args)
    raise NotExistingPlanetException, 'No planet'
    # rescue NotExistingPlanetException => e
    #   e.message.to_s
  end

  # rubocop requires respond_to_missing? for method_missing
  def respond_to_missing?(_method_name, _include_private = false)
    true
  end

  def each(&block)
    PLANTES.each do |member|
      block.call(member)
    end
  end

  def size
    PLANTES.reduce(0) { |memo, (_key, _val)| memo + 1 }
  end

  def to_h
    PLANTES.map do |planet|
      [planet.first, planet.last]
    end.to_h
  end
end
