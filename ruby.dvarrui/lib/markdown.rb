
require_relative 'markdown/markdown-link'

class Markdown
  def self.link(dirname, options)
    # require 'pry-byebug'; binding.pry
    if options['info']
      MarkdownLink.show_info dirname
    elsif options['check']
      MarkdownLink.show_info dirname
    end
  end
end
