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



def ask_move
  puts "Type the location you would like to mark."
  display_board
end

@board = {"a1" => "A1", "a2" => "A2", "a3" => "A3", "b1" => "B1", "b2" => "B2", "b3" => "B3", "c1" => "C1", "c2" => "C2", "c3" => "C3"}

def display_board
  puts "#{@board["a1"]} #{@board["a2"]} #{@board["a3"]}" 
  puts "#{@board["b1"]} #{@board["b2"]} #{@board["b3"]}" 
  puts "#{@board["c1"]} #{@board["c2"]} #{@board["c3"]}" 
end

def mark_board_X
  puts "Player 1: Type the location you would like to mark."
  answer = gets.chomp
  @board[answer.downcase] = "X "
  display_board
end

def mark_board_O
  puts "Player 2: Type the location you would like to mark."
  answer = gets.chomp
  @board[answer.downcase] = "O "
  display_board
end

def play
display_board
counter = 0
while counter < 8
 mark_board_X
  counter+=1
mark_board_O
  counter+=1
end
puts "GAME OVER. Stalemate."
end

play