#!/usr/bin/env ruby

require 'digest'

if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

begin
  File.open(dictionary_file, 'r') do |file|
    file.each_line do |line|
      word = line.chomp
      if Digest::SHA256.hexdigest(word) == hashed_password
        puts "Password found: #{word}"
        exit
      end
    end
  end
rescue Errno::ENOENT
  puts "Dictionary file not found."
  exit
end

puts "Password not found in dictionary."

