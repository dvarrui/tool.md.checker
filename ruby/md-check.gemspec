require 'date'
require_relative 'lib/md-check/version'

Gem::Specification.new do |s|
  s.name        = Version::NAME
  s.version     = Version::VERSION
  s.date        = Date.today.strftime("%Y-%m-%d")
  s.summary     = "Detect broken links into Markdown files"
  s.description = <<-EOF
    Detect broken links into Markdown files.
  EOF

  s.extra_rdoc_files = [ 'README.md', 'LICENSE' ] +
                       Dir.glob(File.join('docs','**','*.md'))

  s.license     = 'GPL-3.0'
  s.authors     = ['David Vargas Ruiz']
  s.email       = 'dvarrui@protonmail.com'
  s.homepage    = Version::HOMEPAGE

  s.executables << Version::NAME
  s.files       = Dir.glob(File.join('lib', '**', '*.*'))

  s.required_ruby_version = '>= 3.0.0'

  s.add_runtime_dependency 'colorize', '~> 0.8.1'
  s.add_runtime_dependency 'terminal-table', '~> 3.0'
  s.add_runtime_dependency 'thor', '~> 1.1'

  s.add_development_dependency 'minitest', '~> 5.11'
  s.add_development_dependency 'rubocop', '~> 0.74'
end
