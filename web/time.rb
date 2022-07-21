#!usr/bin/ruby -w
require 'io/console'
time = Time.new

# Components of a time

puts "Current Time : " + time.inspect
puts time.year
puts time.month
puts time.day
puts time.wday
puts time.yday
puts time.hour
puts time.min
puts time.sec
puts time.usec
puts time.zone
STDIN.getch
print("             \r")