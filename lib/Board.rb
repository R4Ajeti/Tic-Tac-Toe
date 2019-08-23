# frozen_string_literal: true

class Board
  # This class manages sample and input boards
  # example_board
  def example_board
    b = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    b
  end

  # add_space
  def add_space(symb, nlen)
    space = ''
    (0..nlen - 1).each do
      space += symb
    end
    space
  end

  # print_board
  def print_board(arr, clen)
    ans = ''
    arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] if arr.nil?
    row = arr.length
    col = arr[0].length

    cell_length = clen
    (0..row - 1).each do |i|
      line = ''
      if i.positive && i < row
        ans += '\n' + add_space('-', cell_length).to_s + '+'
        ans += add_space('-', cell_length).to_s + '+'
        ans += add_space('-', cell_length).to_s
      end
      (0..col - 1).each do |j|
        line += '|' if j.positive && j < col
        line += add_space(' ', (cell_length / 2).floor).to_s
        line += (arr[i][j]).to_s
        line += add_space(' ', (cell_length / 2).floor).to_s
      end
      ans += '\n'
      ans += line
    end
    ans
  end
end
