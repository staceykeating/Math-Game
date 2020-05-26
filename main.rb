require './players'
require './questions'

def start 
  "  
*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*
*~*~*~*~*G E T  R E A D Y  T O  P L A Y ~*~*~**~*~*~*~
*~*~*~*~*T H E  M A T H  G A M E *~*~*~*~*~*~*~*~**~*~
*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~**~*~
*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~**~*~
"
end

puts start
print "
*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~**~*~
*~*~*~*~*~*~*~P l a y e r  1 ! **~*~*~*~*~*~*~**~*~*~*
*~*~*~*~* W h a t  i s  y o u r  n a m e ?  *~*~*~*~*~
*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~**~*~
"
name_one = gets.chomp
print "

*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~**~*~
*~*~*~*~*~*~*~P l a y e r  2 ! **~*~*~*~*~*~*~**~*~*~*
*~*~*~*~* W h a t  i s  y o u r  n a m e ?  *~*~*~*~*~
*~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~*~*~*~*~*~**~*~**~*~
"
name_two = gets.chomp

player_one = Players.new(name_one)
player_two = Players.new(name_two)

# puts player_one.name
# puts player_two.name

this_player = 1

while player_one.lives > 0 && player_two.lives > 0 do
  player = (this_player == 1) ? player_one : player_two
  question = Questions.new()

    puts "
    .............................................
    .......Okay..................................
    .........#{player.name}..........................
    ....................YOU'RE UP!!!!............
    What is #{question.random1} plus #{question.random2}??? 
    Take your time and only answer when you are sure.
    "

  response = gets.chomp

  if question.answer.to_i == response.to_i
    puts "
    .............................................
    That ........................................
    ................is...........................
    .............................................
    .......................Correct!..............
    .............................................
     .........Congratulations!...................
    .............................................
    "
    puts "Let's see how many lives our players have left: 
    #{player_one.name}: #{player_one.lives} / 3 #{player_two.name} #{player_two.lives}: / 3
    .............................................
    "
    

  else 
    puts "
    ..............................................
    ...........Ohhhhhh............................
    I am sorry, but that is NOT the correct answer
    ..............................................
    "
    player.lives -= 1


    puts "
    ...............................................
    Let's see how many lives our players have left: 
    #{player_one.name}: #{player_one.lives} / 3 #{player_two.name} #{player_two.lives}: / 3
    ..............................................."
  end
  this_player = (this_player +1 ) % 2
end


if (player_one.lives = 0 || player_two.lives = 0)
  if player_one.lives > 0 
    winner = player_one
  else
    winner = player_two
  end
  puts "
  ..............................................

  Well there you have it folks! #{player_one.name} & #{player_two.name}... great game! 
  And congratulations to our winner #{winner.name} !!! 
  ....................................................
  Thanks everyone for watching and we hope to see you 
  all again on the next episode!
  ....................................................
  "

end

