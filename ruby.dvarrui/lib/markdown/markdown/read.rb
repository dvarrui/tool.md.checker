
require_relative 'debug'

class Markdown
  class Read
    def self.locate_md_filenames_from(dirname)
      Dir.glob(File.join(dirname,'**','*.md'))
    end

    def self.get_lines_with_links_into(filename)
      selected = []
      all = File.read(filename).split("\n")
      all.each_with_index do |line, index|
        if line.include? ']('
          linkdata = extract_link_data_from_line(line)
          url = linkdata[:url]
          unless url.nil? or url.start_with?('http')
            selected << { filename: filename,
                          lineindex: index,
                          line: line,
                          linktext: linkdata[:text],
                          linkurl: linkdata[:url]}
          end
        end
      end
      selected
    end

    def self.extract_link_data_from_line(line)
      result = /[\*A-Za-z0-9%¿?=.:\s\-\/]*\[([áéíóúA-Za-z0-9%¿?=.:\s\-\/]*)\]\(([A-Za-z0-9%¿?=.:\s\-\/]*)\)\s*/.match(line)
      # Debug.match_data(result)
      { text: result.to_a[1], url: result.to_a[2]}
    end
  end
end
