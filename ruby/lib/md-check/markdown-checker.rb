#require 'pry-byebug';     binding.pry

class MarkdownChecker

  def self.check_dirname(dirname)
    filenames = locate_md_filenames_from(dirname)
    puts "[ info ] Cheking files from #{@dirname}"
    filenames.each do |filename|
      puts " => Cheking file: #{filename}"
      rawlines = get_lines_with_links_into filename
      puts "    - Lines to revise : #{rawlines.size}"
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
        selected << { filename: filename, index: index, line: line }
        revise_line(line)
      end
    end
    selected
  end

  def self.revise_line(line)
    result = /[a-z\.\s]*\[([áéíóúA-Za-z0-9%¿?=.:\s\-\/]*)\]\(([A-Za-z0-9%¿?=.:\s\-\/]*)\)\s*/.match(line)
    debug_match_data(result)
  end

  def self.debug_match_data(result)
    if result.to_a.size.zero?
      puts "\n[ignore] #{line}"
    else
      puts "\n[ DEBUG] #{result}: "
      result.to_a.each_with_index do |value,index|
        puts " #{index} : #{value}"
      end
    end
  end
end
