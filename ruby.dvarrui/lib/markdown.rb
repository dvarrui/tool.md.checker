
require_relative 'markdown/markdown-link'
require_relative 'markdown/version'

class Markdown
  def self.link(dirname, options)
    # require 'pry-byebug'; binding.pry
    if options['info']
      MarkdownLink.show_info dirname
      exit 0
    end

    if options['check']
      MarkdownLink.show_info dirname
      exit 0
    end

    puts "Usage: #{Version::NAME} help"
  end
end
