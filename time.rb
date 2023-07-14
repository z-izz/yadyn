#!/usr/bin/ruby -w

module TimeOfDay
    MIDNIGHT = 0
    MORNING = 1
    AFTERNOON = 2
    EVENING = 3
    NIGHT = 4
end
  
def get_time(midnight, morning, afternoon, evening, night)
    current = `date +%H`

    hour = current.to_i

    if hour >= midnight.to_i && hour < morning.to_i
        return TimeOfDay::MIDNIGHT
    elsif hour >= morning.to_i && hour < afternoon.to_i
        return TimeOfDay::MORNING
    elsif hour >= afternoon.to_i && hour < evening.to_i
        return TimeOfDay::AFTERNOON
    elsif hour >= evening.to_i && hour < night.to_i
        return TimeOfDay::EVENING
    else
        return TimeOfDay::NIGHT
    end
end