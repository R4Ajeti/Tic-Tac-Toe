# frozen_string_literal: true

require_relative('./../bin/game_controller')
require_relative('./../lib/Game')
require_relative('./../lib/Board')

game_index = 0
game = []

loop do
  game[game_index] = Game_controller.new(Game.new, Board.new)
  game_index += 1
  puts 'Do you want to play again? : (Y/N)'
  wish = gets.chomp.to_s.upcase
  break if wish == 'N'
end
