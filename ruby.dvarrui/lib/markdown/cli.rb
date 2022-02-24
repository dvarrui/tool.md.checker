
require 'thor'
require_relative 'version'
require_relative '../markdown'

##
# Command Line User Interface
class CLI < Thor
  map ['--help'] => 'help'

  map ['--version'] => 'version'
  desc 'version', 'Show the program version'
  def version
    puts "#{Version::NAME} version #{Version::VERSION}"
    exit 0
  end

  map ['--link', 'links', '--links'] => 'link'
  option '--info', type: :boolean, desc: 'Show info about MD links'
  option '--check', type: :boolean, desc: 'Check info about MD links'
  desc 'link DIRNAME [--info, --check]', 'Do action with MarkDown links'
  def link(dirname)
    Markdown.link(dirname, options)
  end

  def method_missing(method, *_args, &_block)
    link(method.to_s)
  end

  def respond_to_missing?(_method_name)
    true
  end

  def self.exit_on_failure?
    true
  end
end
