
require_relative 'md-check/markdown-checker'

class MDCheck
  def self.check_dirname(dirname)
    MarkdownChecker.check_dirname dirname
  end
end
