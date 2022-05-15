# frozen_string_literal: true

# class UserException
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

  def method_missing(method, *_args)
    raise NotExistingPlanetException, "Планеты '#{method}' в солнечной системе не существует!"
  rescue NotExistingPlanetException => e
    puts e.message.to_s
  end

  # rubocop requires respond_to_missing? for method_missing
  def respond_to_missing?(_method_name, _include_private = false)
    true
  end

  def each(&block)
    initialize.each do |member|
      block.call(member)
    end
  end

  def size
    initialize.reduce(0) { |memo, (_key, _val)| memo + 1 }
  end

  def to_h
    hash = {}
    initialize.each do |planet|
      hash[planet.first] = planet.last
    end
  end
end
