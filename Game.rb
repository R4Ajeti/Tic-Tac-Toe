require './SymbolTB'
require './Functions'
require './Board'

$player_name = Array[nil,nil]
$player_weapon = Array[nil,nil]
$player_title = Array["What do you wanna be called?","You are playing against?"]
$new_board = [["","",""],["","",""],["","",""]]
$player_choice = Array.new(2) { Array.new(5) { Array.new(2) } }
$player_count=Array[0,0];
$marks_checked = Array[];

=begin
    Header of the Game !BEGIN
=end
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
=begin
    Header of the Game !END
=end
    
=begin
    Dev of the Game !BEGIN
=end
for a in 0..$player_name.length-1
    table = SymbolTB.new($player_title[a], " ", " ", @table_width, 0)
    table.print__symbol__table do |m|
        puts "#{m}"
    end
    
    $player_name[a] = gets.strip
    s = false;
    loop do
        if s
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
    
print_board(nil,5)

for a in 0..8
    puts "Iteration: "
    puts a
    $player_index=a % 2
    puts $player_index
    puts "Its #{$player_name[$player_index]}'s turn"

    s = false
    loop do
        if s
            table = SymbolTB.new("Wrong Number! :(", " ", " ", @table_width, 0)
            table.print__symbol__table do |m|
                puts "#{m}"
            end
        end
        concat = $player_name[a]
        puts " Give me a number of available square to hit"
        s = true;
        cache = "#{gets.strip}".to_i
        if( cache>0 && cache<10 && !in_array(cache,$marks_checked) )
            $marks_checked[a]=cache
            cache = tableNumTochoice(cache)
            $new_board[cache[0]][cache[1]] = $player_weapon[$player_index]
            $player_choice[$player_index][$player_count[$player_index]] = $new_board[cache[0]][cache[1]]
            $player_count[$player_index]=$player_count[$player_index]+1
            break
        end 
    end
    print_board($new_board,5)
end


=begin
    Dev of the Game !END
=end