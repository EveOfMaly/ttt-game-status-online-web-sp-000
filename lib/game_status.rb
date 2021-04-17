# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  #top row 
  [3,4,5],  #middle row 
  [6,7,8],   #last row 
  [0,3,6],   #left column
  [1,4,7],   #middle columnn
  [2,5,8],   ##right column
  [0,4,8],  #diangle
  [6,4,2]  #diangle 
]


def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   
   position_1 = board[win_index_1] # value of board at win_index_1
   position_2 = board[win_index_2] # value of board at win_index_2
   position_3 = board[win_index_3] # value of board at win_index_3
   
   if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end
  return false
end



def full?(board)
 if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end 

def draw?(board)
  if !won?(board) &&  full?(board) 
    return true 
    elsif !won?(board) &&  full?(board)
    return false
  else won?(board) 
    return false 
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board) 
    return true 
  else
    return false
  end
end 


def winner(board)
  if won?(board)
      return board[won?(board)[0]]
  end
end 


  
  

    
    
    