
require_relative 'md-check/markdown-checker'

class MDCheck
  def self.check_dir(dirname)
    MarkdownChecker.new(dirname)
  end
end
