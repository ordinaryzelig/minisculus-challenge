$LOAD_PATH << '.'
require 'init.rb'

puts MarkI.wheel_position(6).encode('Strong NE Winds!')
puts MarkII.wheel_positions(9, 3).encode('The Desert Fox will move 30 tanks to Calais at dawn')
puts MarkIV.wheel_positions(4, 7).encode('The white cliffs of Alghero are visible at night')
