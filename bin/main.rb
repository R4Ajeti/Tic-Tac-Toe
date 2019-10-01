# frozen_string_literal: true

require_relative('./../lib/Game_controller')
require_relative('./../lib/Game')
require_relative('./../lib/board')

game_index = 0
game = []

loop do
  game[game_index] = Game_controller.new(Game.new, BOARD.new)
  game_index += 1
  puts 'Do you want to play again? : (Y/N)'
  wish = gets.chomp.to_s.upcase
  break if wish == 'N'
end
