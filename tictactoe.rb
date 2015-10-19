@board = {"a1" => "A1", "a2" => "A2", "a3" => "A3", "b1" => "B1", "b2" => "B2", "b3" => "B3", "c1" => "C1", "c2" => "C2", "c3" => "C3"}
#Using a hash allows the program to search for all keys with the same value, which is how the #recognize_win method functions
@board_array = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
#Every time a play is made the corresponding string is removed from board_array, allowing the computer to choose only from open squares

def display_board #just makes the board visible to user
  puts "#{@board["a1"]} #{@board["a2"]} #{@board["a3"]}" 
  puts "#{@board["b1"]} #{@board["b2"]} #{@board["b3"]}" 
  puts "#{@board["c1"]} #{@board["c2"]} #{@board["c3"]}" 
end

def mark_board(player) #accepts an argument of either X or O for 2-player, removes string from array for playing computer, marks players selection on board
  puts "Player #{player}: Type the location you would like to mark."
  answer = gets.chomp.downcase
  if @board_array.include?(answer)
    @board[answer] = "#{player} "
    @board_array.delete(answer)
    display_board
  else 
    puts "I'm sorry, either that was an invalid entry or that spot has already been taken. Please try again."
    mark_board(player)
  end
end


def mark_board_computer_easy 
puts "Computer marks with an O"
  move = @board_array.sample
  @board[move] = "O "
  @board_array.delete(move)
  display_board 
end


def mark_board_computer_hard
  puts "Computer marks with an O"
  if @board["a1"] == "X " && @board["a2"] == "X " && @board_array.include?("a3")
    @board["a3"] = "O " 
    @board_array.delete("a3")
  elsif @board["a1"] == "X " && @board["a3"] == "X " && @board_array.include?("a2")
    @board["a2"] = "O "
    @board_array.delete("a2")
  elsif @board["a2"] == "X " && @board["a3"] == "X " && @board_array.include?("a1")
    @board["a1"] = "O "
    @board_array.delete("a1")
  elsif @board["b1"] == "X " && @board["b2"] == "X " && @board_array.include?("b3")
    @board["b3"] = "O "
    @board_array.delete("b3")
  elsif @board["b1"] == "X " && @board["b3"] == "X " && @board_array.include?("b2")
    @board["b2"] = "O "
    @board_array.delete("b2")
  elsif @board["b2"] == "X " && @board["b3"] == "X " && @board_array.include?("b1")
    @board["b1"] = "O "
    @board_array.delete("b1")
  elsif @board["c1"] == "X " && @board["c2"] == "X " && @board_array.include?("c3")
    @board["c3"] = "O "
    @board_array.delete("c3")
  elsif @board["c1"] == "X " && @board["c3"] == "X " && @board_array.include?("c2")
    @board["c2"] = "O "
    @board_array.delete("c2")
  elsif @board["c2"] == "X " && @board["c3"] == "X " && @board_array.include?("c1")
    @board["c1"] = "O "
    @board_array.delete("c1")
  elsif @board["a1"] == "X " && @board["b1"] == "X " && @board_array.include?("c1")
    @board["c1"] = "O "
    @board_array.delete("c1")
  elsif @board["a1"] == "X " && @board["c1"] == "X " && @board_array.include?("b1")
    @board["b1"] = "O "
    @board_array.delete("b1")
  elsif @board["b1"] == "X " && @board["c1"] == "X " && @board_array.include?("a1")
    @board["a1"] = "O "
    @board_array.delete("a1")
  elsif @board["a2"] == "X " && @board["b2"] == "X " && @board_array.include?("c2")
    @board["c2"] = "O "
    @board_array.delete("c2")
  elsif @board["a2"] == "X " && @board["c2"] == "X " && @board_array.include?("b2")
    @board["b2"] = "O "
    @board_array.delete("b2")
  elsif @board["b2"] == "X " && @board["c2"] == "X " && @board_array.include?("a2")
    @board["a2"] = "O "
    @board_array.delete("a2")
  elsif @board["a3"] == "X " && @board["b3"] == "X " && @board_array.include?("c3")
    @board["c3"] = "O "
    @board_array.delete("c3")
  elsif @board["a3"] == "X " && @board["c3"] == "X " && @board_array.include?("b3")
    @board["b3"] = "O "
    @board_array.delete("b3")
  elsif @board["b3"] == "X " && @board["c3"] == "X " && @board_array.include?("a3")
    @board["a3"] = "O "
    @board_array.delete("a3")
  elsif @board["a1"] == "X " && @board["b2"] == "X " && @board_array.include?("c3")
    @board["c3"] = "O "
    @board_array.delete("c3")
  elsif @board["a1"] == "X " && @board["c3"] == "X " && @board_array.include?("b2")
    @board["b2"] = "O "
    @board_array.delete("b2")
  elsif @board["b2"] == "X " && @board["c3"] == "X " && @board_array.include?("a1")
    @board["a1"] = "O "
    @board_array.delete("a1")
  elsif @board["a3"] == "X " && @board["b2"] == "X " && @board_array.include?("c1")
    @board["c1"] = "O "
    @board_array.delete("c1")
  elsif @board["a3"] == "X " && @board["c1"] == "X " && @board_array.include?("b2")
    @board["b2"] = "O "
    @board_array.delete("b2")
  elsif @board["b2"] == "X " && @board["c1"] == "X " && @board_array.include?("a3")
    @board["a3"] = "O "
    @board_array.delete("a3")
  else move = @board_array.sample
  @board[move] = "O "
  @board_array.delete(move)
end
display_board
end


def recognize_win(player) #used to break loop if a player has won. 
  #To be honest I'm not totally happy with this - it works, but it also seems unnecessarily long
  #Would rather it could recognize patterns but have not been able to figure out how to make a table and make it recognize three in a row
  win_array = []
  @board.select {|key, value| win_array << key if value == "#{player} "}
  if win_array.include?("a1") && win_array.include?("a2") && win_array.include?("a3")
    true
  elsif win_array.include?("b1") && win_array.include?("b2") && win_array.include?("b3")
    true
  elsif win_array.include?("c1") && win_array.include?("c2") && win_array.include?("c3")
    true
  elsif win_array.include?("a1") && win_array.include?("b1") && win_array.include?("c1")
    true
  elsif win_array.include?("a2") && win_array.include?("b2") && win_array.include?("c2")
    true
  elsif win_array.include?("a3") && win_array.include?("b3") && win_array.include?("c3")
    true
  elsif win_array.include?("a1") && win_array.include?("b2") && win_array.include?("c3")
    true
  elsif win_array.include?("a3") && win_array.include?("b2") && win_array.include?("c1")
    true
  else false
  end  
end



def play_2_player #method for 2 player game
  #ends if player wins or all nine places used
  #again, feel it is unnecessarily long and repetitive - working on simplifying
display_board
counter = 0
loop do
 mark_board("X")
 puts "PLAYER X WINS! Game Over." if recognize_win("X") == true
 break if recognize_win("X") == true 
counter+=1
puts "STALEMATE. Game Over" if counter == 9
break if counter == 9 
  mark_board("O")
  puts "PLAYER O WINS! Game Over." if recognize_win("O") == true
  break if recognize_win("O") == true 
counter+=1
end 
end

def play_computer #nearly identical to 2 player method except uses #mark_board_computer method
  #again, working to possibly simplify/combine methods as they are nearly the same
  display_board
  counter = 0
loop do
  mark_board("X")
 puts "YOU WIN! Game Over." if recognize_win("X") == true
 break if recognize_win("X") == true 
counter+=1
puts "STALEMATE. Game Over." if counter == 9
break if counter == 9 
yield #yields in #easy_or_hard to which play computer program is chosen
uts "COMPUTER WINS! Game Over." if recognize_win("O") == true
  break if recognize_win("O") == true 
  counter+=1
end
end



def greeting #initiates game with user - is the only method that needs to be called for all other methods to run
puts "Would you like to play Tic Tac Toe? (yes/no)"
answer = gets.chomp.downcase
if answer.include? "no"
  puts "Fine, whatever.
   I didn't want to play with you anyway."
elsif answer.include? "yes"
  player_or_comp
else 
  puts "Sorry, I didn't understand your answer. Please try again."
  greeting
end
end

def player_or_comp #allows user to choose to play either computer or another person
  puts "Awesome! Please type 1 to play the computer or 2 to play two-player."
  answer = gets.to_i
  if answer == 1
    easy_or_hard
  elsif answer == 2
    play_2_player
  else "Sorry, I didn't understand your answer. Please try again."
    player_or_comp
  end
end

def easy_or_hard #allows user to choose level to play
  puts "Please type 1 to play on easy or 2 to play on hard."
  answer = gets.to_i
  if answer == 1
    play_computer {mark_board_computer_easy}
  elsif answer == 2
    play_computer {mark_board_computer_hard}
  else "Sorry, I didn't understand your answer. Please try again."
    easy_or_hard
  end
end


greeting
