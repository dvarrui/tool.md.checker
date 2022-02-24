
class MarkdownChecker
  def initialize(dirname)
    @dirname = dirname
    check_dirname(@dirname)
  end

  def locate_md_filenames_from(dirname)
    Dir.glob(File.join(dirname,'**','*.md'))
  end

  def check_dirname(dirname)
    filenames = locate_md_filenames_from(dirname)
    puts "[ info ] Cheking files from #{@dirname}"
    filenames.each do |filename|
      puts " => Cheking file: #{filename}"
      lines = get_lines_with_links_into filename
    end
  end

  def get_lines_with_links_into(filename)
    content = File.read(filename)
    lines = content.split("\n")
    puts lines.size
  end
end
