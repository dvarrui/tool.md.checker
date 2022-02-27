
require 'colorize'
require_relative 'functions'

class MarkdownShowLinks

  def self.process(dirname, verbose = false)
    filenames = Functions.locate_md_filenames_from(dirname)
    print "[ markdown ] Show link info about #{filenames.size.to_s} files".cyan
    puts " from #{dirname}".cyan
    filenames.each_with_index do |filename, index|
      #require 'pry-byebug'; binding.pry
      linklines = Functions.get_lines_with_links_into filename

      unless linklines.size.zero?
        print "[ markdown ] File: #{filename} (".light_yellow
        puts "#{linklines.size} link/s)".light_yellow
        Debug.lines_with_links(linklines) if verbose
      end
    end
    exit 0
  end
end
