
require 'colorize'
require_relative 'debug'
require_relative 'read'

class Markdown
  class Link
    def self.show_info(dirname)
      filenames = Read.locate_md_filenames_from(dirname)
      print "[ info ] Show link info about #{filenames.size.to_s} files".cyan
      puts " from #{dirname}".cyan
      filenames.each_with_index do |filename, index|
        #require 'pry-byebug'; binding.pry
        linklines = Read.get_lines_with_links_into filename

        unless linklines.size.zero?
          print "[ info ] File: #{filename} (".light_yellow
          puts "#{linklines.size} link/s)".light_yellow
          Debug.lines_with_links(linklines)
        end
      end
    end

    def self.check(dirname)
      filenames = Read.locate_md_filenames_from(dirname)
      print "[ check ] Show link info about #{filenames.size.to_s} files".cyan
      puts " from #{dirname}".cyan
      filenames.each_with_index do |filename, index|
        #require 'pry-byebug'; binding.pry
        linklines = Read.get_lines_with_links_into filename

        unless linklines.size.zero?
          print "[ check ] File: #{filename} (".light_yellow
          puts "#{linklines.size} link/s)".light_yellow
          Debug.lines_with_links(linklines)
        end
      end
    end

  end
end
