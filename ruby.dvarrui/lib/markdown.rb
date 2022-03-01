
require_relative 'markdown/markdown/link'
require_relative 'markdown/version'
require_relative 'markdown/link/show_info'
require_relative 'markdown/link/check_links'

class Markdown
  def self.link(dirname, options)
    if options['info']
      Markdown.Link.show_info dirname
      exit 0
    end

    if options['check']
      Markdown.Link.checks dirname
      exit 0
    end

    puts "Usage: #{Version::NAME} help"
    exit 1
  end
end
