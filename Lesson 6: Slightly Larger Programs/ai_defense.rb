# ai_defense.rb
# The computer currently picks a square at random. That's not very interesting.
# Let's make the computer defensive minded, so that if there's an immediate
# threat, then it will defend the 3rd square. We'll consider an "immediate
# threat" to be 2 squares marked by the opponent in a row. If there's no
# immediate threat, then it will pick a random square.

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def ai_defense_needed?(brd)
  threats = WINNING_LINES.map do |line|
              brd.values_at(*line).count(PLAYER_MARKER) == 2 && \
              brd.values_at(*line).count(INITIAL_MARKER) == 1
            end
  threats.include?(true)
end

def computer_places_piece!(brd)
  if ai_defense_needed?(brd)
    WINNING_LINES.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 2 && \
         brd.values_at(*line).count(INITIAL_MARKER) == 1
        brd[line[brd.values_at(*line).index(' ')]] = 'O'
        break
      end
    end
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

board = {1=>" ", 2=>" ", 3=>" ", 4=>"X", 5=>" ", 6=>"X", 7=>" ", 8=>" ", 9=>" "} 
puts ai_defense_needed?(board)