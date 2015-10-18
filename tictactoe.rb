def greeting
puts "Would you like to play Tic Tac Toe? (yes/no)"
answer = gets.chomp.downcase
if answer.include? "no"
  puts "Fine, whatever."
elsif answer.include? "yes"
  puts "Great, let's play!"
else 
  puts "Sorry, I didn't understand your answer."
end
end



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
while counter < 9
 mark_board("X")
  counter+=1
mark_board("O")
  counter+=1
end
puts "GAME OVER. Stalemate."
end

def play_computer_easy
  display_board
  counter = 0
while counter < 9
 mark_board(X)
  counter+=1
mark_board_computer_easy
  counter+=1
end
puts "GAME OVER. Stalemate."
end

play_2_player
