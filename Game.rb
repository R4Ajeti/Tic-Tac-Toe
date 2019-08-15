require './SymbolTB'
require './Functions'
require './Board'

$player_name = Array[nil,nil]
$player_weapon = Array[nil,nil]
$player_title = Array["What do you wanna be called?","You are playing against?"]

=begin
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
=end

=begin
for a in 0..$player_name.length-1
    table = SymbolTB.new($player_title[a], " ", " ", @table_width, 0)
    table.print__symbol__table do |m|
        puts "#{m}"
    end

    $player_name[a] = gets.strip
    s = false;
    loop do
        if s
            puts "this got exectuted"
            table = SymbolTB.new("Wrong weapon chosen! :(", " ", " ", @table_width, 0)
            table.print__symbol__table do |m|
                puts "#{m}"
            end
        end
        concat = $player_name[a].strip
        table = SymbolTB.new("Choose your Weapon, X or O?", " ", " ", @table_width, 0)
        table.print__symbol__table do |m|
            puts "#{m}"
        end
        s = true;
        $player_weapon[a] = (gets.strip).upcase
        puts true
        if(weapon_confimation($player_weapon[a], $player_weapon[a % $player_name.length-1]))
            break
        end 
    end
end

puts $player_weapon[0]
puts $player_weapon[1]
=end

print_board(nil,3)
