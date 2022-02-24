
require 'thor'
require_relative 'version'
require_relative '../md-check'

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

  map ['--dir'] => 'dir'
  desc 'dir DIRNAME', 'Check MD files into DIRNAME'
  def dir(dirname)
    MDCheck.check_dirname(dirname)
  end

  def method_missing(method, *_args, &_block)
    dir(method.to_s)
  end

  def respond_to_missing?(_method_name)
    true
  end

  def self.exit_on_failure?
    true
  end
end
