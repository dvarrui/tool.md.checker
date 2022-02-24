
require 'colorize'

class Debug

  def self.match_data(result)
    if result.to_a.size.zero?
      puts "\n[ignore] #{line}"
    else
      puts "\n[ DEBUG] #{result}: "
      result.to_a.each_with_index do |value,index|
        puts " #{index} : #{value}".white
      end
    end
  end

  def self.lines_with_links(lines)
    lines.each do |line|
      puts "  * #{line[:lineindex]}|#{line[:linkurl]}"
    end
  end
end
