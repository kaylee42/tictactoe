@board = {"a1" => "A1", "a2" => "A2", "a3" => "A3", "b1" => "B1", "b2" => "B2", "b3" => "B3", "c1" => "C1", "c2" => "C2", "c3" => "C3"}
@board_array = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]

def display_board
  puts "#{@board["a1"]} #{@board["a2"]} #{@board["a3"]}" 
  puts "#{@board["b1"]} #{@board["b2"]} #{@board["b3"]}" 
  puts "#{@board["c1"]} #{@board["c2"]} #{@board["c3"]}" 
end

def mark_board(player)
  puts "Player #{player}: Type the location you would like to mark."
  answer = gets.chomp
  @board[answer.downcase] = "#{player} "
  @board_array.delete(answer.downcase)
  display_board
end


def mark_board_computer_easy
  puts "Computer marks with an O"
  move = @board_array.sample
  @board[move] = "O "
  @board_array.delete(move)
  display_board
end 

def recognize_win(player)
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



def play_2_player
display_board
counter = 0
loop do
 mark_board("X")
 puts "GAME OVER. Player X wins!" if recognize_win("X") == true
 break if recognize_win("X") == true 
counter+=1
puts "GAME OVER. Stalemate." if counter == 9
break if counter == 9 
  mark_board("O")
  puts "GAME OVER. Player O wins!" if recognize_win("O") == true
  break if recognize_win("O") == true 
counter+=1
end 
end

def play_computer_easy
  display_board
  counter = 0
loop do
  mark_board("X")
 puts "GAME OVER. You win!" if recognize_win("X") == true
 break if recognize_win("X") == true 
counter+=1
puts "GAME OVER. Stalemate." if counter == 9
break if counter == 9 
mark_board_computer_easy
uts "GAME OVER. Computer wins!" if recognize_win("O") == true
  break if recognize_win("O") == true 
  counter+=1
end
end

def greeting
puts "Would you like to play Tic Tac Toe? (yes/no)"
answer = gets.chomp.downcase
if answer.include? "no"
  puts "Fine, whatever."
elsif answer.include? "yes"
  puts "Awesome!"
  player_or_comp
else 
  puts "Sorry, I didn't understand your answer. Please try again."
  greeting
end
end

def player_or_comp
  puts "Please type 1 to play the computer or 2 to play two-player."
  answer = gets.to_i
  if answer == 1
    play_computer_easy
  elsif answer == 2
    play_2_player
  else "Sorry, I didn't understand your answer. Please try again."
    player_or_comp
  end
end

greeting 
