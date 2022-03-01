
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

    def self.show_lines_with_links(lines)
      lines.each do |line|
        lineindex = "%04d" % line[:lineindex]
        puts "    LINE: #{lineindex} | URL: #{line[:linkurl]}"
      end
    end

    def self.check_links(lines: , dirpath: )
      checked = []
      puts "    LINE | STATUS | URL".white
      lines.each do |line|
        # require 'pry-byebug'; binding.pry
        filepath = File.join(dirpath, line[:linkurl])
        status = 'FAIL'
        status = ' ok ' if File.exist? filepath

        lineindex = "%4d" % line[:lineindex]
        msg = "    #{lineindex} |  #{status}  | #{line[:linkurl]}"

        if status == 'FAIL'
          puts msg.light_red
        else
          puts msg.white
        end
      end
    end

    def self.stop
      require 'pry-byebug'; binding.pry
    end
  end
end
