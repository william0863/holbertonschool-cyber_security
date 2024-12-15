#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
  file1 = File.read(file1_path)
  file2 = File.read(file2_path)

  json1 = JSON.parse(file1)
  json2 = JSON.parse(file2)

  merged_json = json1 + json2

  File.open(file1_path, 'w') do |file|
    file.write(JSON.pretty_generate(merged_json))
    file.write("\n")
  end
end

