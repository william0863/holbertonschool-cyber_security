#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
  file = File.read(path)
  
  data = JSON.parse(file)
  
  user_id_count = Hash.new(0)
  
  data.each do |entry|
    user_id_count[entry["userId"]] += 1
  end
  
  user_id_count.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end

