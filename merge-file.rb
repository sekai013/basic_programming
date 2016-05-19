require 'pathname'

class MergeFiles
  def initialize(directory_path)
    @dir = Dir.open(directory_path)
    @env = {}
    @merged_file = ''
  end

  def parse_file(file_path)
    puts "Parsing #{file_path}"
    File.open(file_path) do |file|
      depth = 0
      file.each do |line|
        if /^\(require/.match(line)
          next
        elsif /^\(define/.match(line)
          name = /^\(define ([\w\-_]+)/.match(line)[1]
          next if @env[name.to_sym]
          @env[name.to_sym] = true
          depth = line.count('(') - line.count(')')
          @merged_file << line
        else
          next if depth == 0
          @merged_file << line
          depth += line.count('(') - line.count(')')
        end
      end
    end
  end

  def print_to_file(file_path)
    File.write(file_path, @merged_file)
  end

  def merge(output_file_path)
    @dir.each do |filename|
      abs_path = File.expand_path(filename, @dir.path)
      parse_file(abs_path) if File.file?(abs_path)
    end

    print_to_file(output_file_path)
  end
end

if __FILE__ == $0
  mergefile = MergeFiles.new(File.expand_path(ARGV[0]))
  mergefile.merge(File.expand_path(ARGV[1]))
end
