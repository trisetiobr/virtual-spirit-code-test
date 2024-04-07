require 'digest'

def file_checksum(file_path)
  Digest::SHA256.file(file_path).hexdigest
end

def count_files_with_same_content(directory)
  content_count = Hash.new(0)

  Dir.foreach(directory) do |filename|
    next if ['.', '..'].include?(filename)

    full_path = File.join(directory, filename)

    if File.file?(full_path)
      content_count[file_checksum(full_path)] += 1
    elsif File.directory?(full_path)
      content_count.merge!(count_files_with_same_content(full_path)) { |_, ov, nv| ov + nv }
    end
  end

  content_count
end

def find_max_content(content_count)
  max_content = content_count.max_by { |_, count| count }
  "#{max_content[0]} #{max_content[1]}"
end

def main(directory)
  content_count = count_files_with_same_content(directory)
  max_content = find_max_content(content_count)
  puts "Files with the same content: #{max_content}"
end

main(ARGV[0])
