
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
    #require 'pry-byebug';     binding.pry
    result = /!\[([a-z\-]*)\]\(([a-z\-\.\/]*)\)\s*/.match(line)
    result
  end
end
