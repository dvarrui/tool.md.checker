
require_relative 'markdown/version'
require_relative 'markdown/link/show_info'
require_relative 'markdown/link/check_links'

class Markdown
  def self.link(dirname, options)
    # require 'pry-byebug'; binding.pry
    MarkdownShowLinks.process dirname if options['info']
    MarkdownShowLinks.process(dirname, verbose: true) if options['verbose']
    MarkdownCheckLinks.process dirname if options['check']
    puts "Usage: #{Version::NAME} help"
    exit 1
  end
end
