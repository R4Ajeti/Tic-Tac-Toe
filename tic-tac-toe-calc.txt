1. for each dif 3 of i | exclude first and last one
2. for each dif 3 of j - exclued first and last one
3. for each dif 3 of i and j + exclued first and last one

O|O|O 
-+-+-
X|X|O 
-+-+-
7|O|9

1/3=0 1
2/3=0 2
3/3=1 0
4/3=1 1
5/3=1 2
6/3=2 0
7/3=2 1
8/3=2 2
9/3=3 0

0/3=0 0
1/3=0 1
2/3=0 2
3/3=1 0
4/3=1 1
5/3=1 2
6/3=2 0


1 2 3
4 5 6
7 8 9




$player_choice[0][0]= tableNumTochoice(5)
puts $player_choice[0][0]

$player_choice[player_index][$player_count[player_index]] = tableNumTochoice(gets.strip)
    $player_count[player_index]++


puts $player_index
    puts "Its #{$player_name[0]}'s turn"

concat = "#{gets.strip}"
        cache = tableNumTochoice(concat.to_i)



