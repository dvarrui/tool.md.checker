
require 'colorize'
require_relative 'debug'

class MarkdownChecker

  def self.check_dirname(dirname)
    filenames = locate_md_filenames_from(dirname)
    print "[ mdcheck ] Checking #{filenames.size.to_s} files"
    puts " from #{dirname.light_blue}"
    filenames.each_with_index do |filename, index|
      #require 'pry-byebug'; binding.pry
      linklines = get_lines_with_links_into filename

      print " => Checking file '#{filename}' with ".light_yellow
      puts "#{linklines.size} links".light_yellow
      Debug.lines_with_links(linklines)
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
        selected << { filename: filename,
                      lineindex: index,
                      line: line,
                      linktext: linkdata[:text],
                      linkurl: linkdata[:url]}
      end
    end
    selected
  end

  def self.extract_link_data_from_line(line)
    result = /[a-z\.\s]*\[([áéíóúA-Za-z0-9%¿?=.:\s\-\/]*)\]\(([A-Za-z0-9%¿?=.:\s\-\/]*)\)\s*/.match(line)
    #Debug.match_data(result)
    { text: result.to_a[1], url: result.to_a[2]}
  end
end
