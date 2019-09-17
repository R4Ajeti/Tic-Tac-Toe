# frozen_string_literal: true

require_relative('./../lib/symbol_t_b')
require_relative('./../lib/functions')
require_relative('./../lib/board')

@debug_on = false
@player_name = Array[nil, nil]
@player_weapon = Array[nil, nil]
@pl_title = Array['What do you wanna be called?', 'You are playing against?']
@new_board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
@pl_choice = Array.new(2) { Array.new { Array.new(2) } }
@player_count = Array[0, 0]
@marks_checked = Array[]
@pl_won = -1
@last_choice = 'N/A'
@wn = Array['Wrong weapon chosen! :(', 'Wrong Number! :(']

fun = Functions.new
board = BOARD.new

game_info = Array['Welcome! Tic Tac Toe', 'Game Rules',
                  'Two players will take turns to mark the',
                  'spaces on a 3x3 grid. The player who',
                  'succeeds in placing 3 of their marks in',
                  'a horizontal, vertical, or diagonal row',
                  'wins the game. When there are no more',
                  'spaces left to mark, it is consider a',
                  'draw. To place a mark on the grid, type',
                  'the number on the space you would like',
                  'to mark! As shown below. Good luck!']

@table_width = 52
table = Symbol_t_b.new('', '*', ' ', @table_width, 0)
table.print_symbol_table do |m|
  puts m.to_s
end

(0..game_info.length - 1).each do |i|
  table = Symbol_t_b.new(game_info[i], '#', ' ', @table_width, 2)
  table.print_symbol_table do |m|
    puts m.to_s
  end
end

table = Symbol_t_b.new('', '*', ' ', @table_width, 0)
table.print_symbol_table do |m|
  puts m.to_s
end

(0..@player_name.length - 1).each do |a|
  table = Symbol_t_b.new(@pl_title[a], ' ', ' ', @table_width, 0)
  table.print_symbol_table do |m|
    puts m.to_s
  end

  @player_name[a] = gets.strip
  s = false
  loop do
    if s
      table = Symbol_t_b.new(@wn[0], ' ', ' ', @table_width, 0)
      table.print_symbol_table do |m|
        puts m.to_s
      end
    end
    table = Symbol_t_b.new('Choose your Weapon, X or O?', ' ',
                           ' ', @table_width, 0)
    table.print_symbol_table do |m|
      puts m.to_s
    end
    s = true
    @player_weapon[a] = gets.strip.upcase
    if fun.weapon_confimation(@player_weapon[a],
                              @player_weapon[a % @player_name.length - 1])
      break
    end
  end
end

(0..5).each do |_new_line|
  puts
end

if @debug_on
  puts @player_weapon[0]
  puts @player_weapon[1]
end

puts board.print_board(nil, 5)

(0..3).each do |_new_line|
  puts
end

(0..8).each do |a|
  puts 'Iteration: '
  puts a
  @player_index = a % 2
  puts "#{@last_choice} - was choosen" if a != 0
  puts "Its #{@player_name[@player_index]}'s turn"

  s = false
  loop do
    if s
      table = Symbol_t_b.new(@wn[1], ' ', ' ', @table_width, 0)
      table.print_symbol_table do |m|
        puts m.to_s
      end
    end
    puts ' Give me a number of available square to hit', s = true
    cache = gets.strip.to_i
    @last_choice = cache
    help = cache < 10 && !fun.in_array(cache, @marks_checked)
    next unless cache.positive? && help

    @marks_checked[a] = cache
    if fun.win_confirmation(cache, @pl_choice[@player_index])
      @pl_won = @player_index
      puts 'won game'
      puts @pl_won
    end
    cache = fun.num_to_choice(cache)
    @new_board[cache[0]][cache[1]] = @player_weapon[@player_index]
    @pl_choice[@player_index][@player_count[@player_index]] = cache
    puts 'Value: '
    puts @pl_choice[@player_index][@player_count[@player_index]][0]
    puts @pl_choice[@player_index][@player_count[@player_index]][1]
    @player_count[@player_index] += 1
    break
  end
  puts board.print_board(@new_board, 5)
  if @pl_won != -1
    puts "Congratulation! #{@player_name[@pl_won]} has won the game"
    (0..@pl_choice[@pl_won].length - 1).each do |w|
      puts "(#{@pl_choice[@pl_won][w][0]}, #{@pl_choice[@pl_won][w][1]})"
    end
    break
  end
  puts 'The game ends with draw! No winner this time :(' if a == 8
end
