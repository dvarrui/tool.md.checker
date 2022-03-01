
require 'colorize'
require_relative 'debug'
require_relative 'read'

class Markdown
  class Link
    def self.show_info(dirname)
      puts "[ markdown ] Running info...".cyan
      filenames = Read.locate_md_filenames_from(dirname)
      msg = "  Show links: #{filenames.size.to_s} files <= #{dirname}"
      puts msg.cyan
      filenames.each_with_index do |filename, index|
        #require 'pry-byebug'; binding.pry
        linklines = Read.get_lines_with_links_into filename

        unless linklines.size.zero?
          msg = "  File: #{filename} (#{linklines.size} link/s)"
          puts msg.light_cyan
          Debug.show_lines_with_links(linklines)
        end
      end
    end

    def self.check(dirname)
      puts "[ markdown ] Running check...".cyan
      filenames = Read.locate_md_filenames_from(dirname)
      msg = "  Check links: #{filenames.size.to_s} files <= #{dirname}"
      puts msg.cyan
      filenames.each_with_index do |filename, index|
        linklines = Read.get_lines_with_links_into filename

        unless linklines.size.zero?
          msg =  "  File: #{filename} (#{linklines.size} link/s)"
          puts msg.white
          Debug.check_links lines: linklines, dirpath: dirname
        end
      end
    end

  end
end
