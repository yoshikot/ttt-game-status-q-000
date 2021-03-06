# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[2])
  end
end

def full?(board)
  board.none?{|spot| spot == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.last]
  end
end

# v3. correctly detects O wins but not X wins;
#     it's because the cycle for O overrides 
#     the results from the cycle for X
#
# def won?(board)
#   characters = ["X","O"]
#   x = 0
#   while x < characters.length  
#     streak = WIN_COMBINATIONS.detect do |combination|
#       combination.all? do |square|
#         board[square] == characters[x]
#       end 
#     end
#     x += 1
#   end   
#   puts "This is it: #{streak}"
# end

# v2. worked when we were just testing X;
#     detect is good b/c it returns an array,
#     not a nested array
#
# def won?(board)
#   WIN_COMBINATIONS.detect do |win|
#     win.all? do |square|
#       board[square] == "X"
#     end
#   end
# end

# v1. worked when I was returning a boolean
#
# def won?(board)
#   WIN_COMBINATIONS.any? do |win|
#     win.all? do |square|
#       board[square] == "X"
#     end
#   end
# end