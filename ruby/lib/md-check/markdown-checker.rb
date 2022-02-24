
class MarkdownChecker
  def initialize(dirname)
    @dirname = dirname
    @filenames = locate_md_filenames_from(@dirname)
    check_all(@filenames)
  end

  def locate_md_filenames_from(dirname)
    Dir.glob(File.join(dirname,'**','*.md'))
  end

  def check_all(filenames)
    filenames.each do |filename|
      puts "[ info ] Cheking file #{filename}"
    end
  end
end
