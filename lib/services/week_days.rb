# frozen_string_literal: true

module Services
  # class WeekDays
  class WeekDays
    def self.generate
      { monday: 'понедельник',
        tuesday: 'вторник',
        wednesday: 'среда',
        thursday: 'четверг',
        friday: 'пятница',
        saturday: 'суббота',
        sunday: 'воскресенье' }
    end
  end
end
