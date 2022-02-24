
require 'colorize'
require_relative 'debug'

class MarkdownLink

  def self.show_info(dirname)
    filenames = locate_md_filenames_from(dirname)
    print "[ markdown ] Show link info about #{filenames.size.to_s} files".cyan
    puts " from #{dirname}".cyan
    filenames.each_with_index do |filename, index|
      #require 'pry-byebug'; binding.pry
      linklines = get_lines_with_links_into filename

      unless linklines.size.zero?
        print "[ markdown ] File: #{filename} (".light_yellow
        puts "#{linklines.size} link/s)".light_yellow
        Debug.lines_with_links(linklines)
      end
    end
  end

  def self.locate_md_filenames_from(dirname)
    Dir.glob(File.join(dirname,'**','*.md'))
  end

  def self.get_lines_with_links_into(filename)
    selected = []
    all = File.read(filename).split("\n")
    all.each_with_index do |line, index|
      if line.include? ']('
        linkdata = extract_link_data_from_line(line)
        url = linkdata[:url]
        unless url.nil? or url.start_with?('http')
          selected << { filename: filename,
                        lineindex: index,
                        line: line,
                        linktext: linkdata[:text],
                        linkurl: linkdata[:url]}
        end
      end
    end
    selected
  end

  def self.extract_link_data_from_line(line)
    result = /[\*A-Za-z0-9%¿?=.:\s\-\/]*\[([áéíóúA-Za-z0-9%¿?=.:\s\-\/]*)\]\(([A-Za-z0-9%¿?=.:\s\-\/]*)\)\s*/.match(line)
    #Debug.match_data(result)
    { text: result.to_a[1], url: result.to_a[2]}
  end
end
