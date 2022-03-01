
require 'colorize'

class Markdown
  class Debug
    def self.match_data(result)
      if result.to_a.size.zero?
        puts "\n[ignore] #{line}"
      else
        puts "\n[ DEBUG] #{result}: "
        result.to_a.each_with_index do |value,index|
          puts " #{(index+1)} : #{value}".white
        end
      end
    end

    def self.lines_with_links(lines)
      puts "  LINE | URL".white
      lines.each do |line|
        lineindex = "%4d" % line[:lineindex]
        puts "  #{lineindex} | #{line[:linkurl]}"
      end
    end
  end
end
