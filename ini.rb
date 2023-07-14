#!/usr/bin/ruby -w

class IniParser
    def initialize(file_path)
      @data = {}
      parse(file_path)
    end
  
    def getValue(section, key)
      @data[section][key] if @data[section]
    end
  
    private
  
    def parse(file_path)
      current_section = nil
  
      File.foreach(file_path) do |line|
        line.strip!
  
        next if line.empty? || line.start_with?('#')
  
        if line.start_with?('[') && line.end_with?(']')
          current_section = line[1..-2]
          @data[current_section] ||= {}
        else
          key, value = line.split('=', 2).map(&:strip)
          @data[current_section][key] = value if current_section
        end
      end
    end
end
  