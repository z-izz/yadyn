#!/usr/bin/ruby -w

puts "- yadyn v1.1.0 -"
puts "Made by z-izz, licensed under GPL2."
puts

require_relative "utilfuncs"
require_relative "time"
require_relative "ini"

filename = ""


if ARGV.size == 1
    filename = ARGV[0]
else
    error("yadyn", "yadyn needs a file that contains configuration data! Pass the file by passing its filepath as an argument!")
    exit 1
end

if not File.exist?(filename)
    error("yadyn", "yadyn needs a file that contains configuration data! Please pass a valid file!")
    exit 1
end

config = IniParser.new(filename)

image_format = config.getValue("bg", "format")
feh_mode = config.getValue("bg", "fitting_mode")

times = [
  config.getValue("stage", "midnight"),
  config.getValue("stage", "morning"),
  config.getValue("stage", "afternoon"),
  config.getValue("stage", "evening"),
  config.getValue("stage", "night")
]


puts "Image format: #{image_format}"
puts "feh mode: #{feh_mode}"
puts "Times: #{times.join(', ')}"
puts "Time: #{get_time(times[0], times[1], times[2], times[3], times[4])}"

puts
puts "Setting wallpaper to #{image_format.sub("%", "#{get_time(times[0], times[1], times[2], times[3], times[4])}")}..."
set_wallpaper(image_format.sub("%", "#{get_time(times[0], times[1], times[2], times[3], times[4])}"))