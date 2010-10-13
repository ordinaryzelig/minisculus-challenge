$LOAD_PATH.unshift '.'
require 'init.rb'

puts Mark1.wheel_position(6).encode('Strong NE Winds!')
puts Mark2.wheel_position(9, 3).encode('The Desert Fox will move 30 tanks to Calais at dawn')
