#!/usr/bin/env ruby

lib_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'anesthetic'

Anesthetic.configure do |c|
  c.dump_descriptors = false
end

def error
  raise 'Oh no!'
end

2.times do |n|
  puts "Attempt ##{n+1}"
  begin
    a = n
    @b = n + 1
    error
  rescue => e
    puts "Error raised: #{e.inspect}"
  end
end

@x = 500
error
