require './SymbolTB'

game_info = Array["Welcome! Tic Tac Toe", "Game Rules", "Two players will take turns to mark the", 
    "spaces on a 3x3 grid. The player who", "succeeds in placing 3 of their marks in", 
    "a horizontal, vertical, or diagonal row", "wins the game. When there are no more", 
    "spaces left to mark, it is consider a", "draw. To place a mark on the grid, type", 
    "the number on the space you would like", "to mark! As shown below. Good luck!"]

@table_width = 52
table = SymbolTB.new("", "*", " ", @table_width, 0)
table.print__symbol__table do |m|
    puts "#{m}"
end

for i in 0..game_info.length-1
    table = SymbolTB.new(game_info[i], "#", " ", @table_width, 2)
    table.print__symbol__table do |m|
        puts "#{m}"
    end
end

table = SymbolTB.new("", "*", " ", @table_width, 0)
table.print__symbol__table do |m|
    puts "#{m}"
end

table = SymbolTB.new("What do you wanna be called?", " ", " ", @table_width, 0)
table.print__symbol__table do |m|
    puts "#{m}"
end

name = gets

table = SymbolTB.new("Choose your Weapon, X or O?", " ", " ", @table_width, 0)
table.print__symbol__table do |m|
    puts "#{m}"
end
weapon = gets