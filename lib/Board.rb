# frozen_string_literal: true

class Board
  def example_board
    b = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    b
  end

  def addSpace(c, n)
    space = ''
    (0..n - 1).each do |_a|
      space += c
    end
    space
  end

  def print_board(arr, cl)
    ans = ''
    arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] if arr.nil?
    row = arr.length
    col = arr[0].length

    cellLength = cl
    (0..row - 1).each do |i|
      line = ''
      if i.positive && i < row
        ans += "\n"
        ans += addSpace('-', cellLength).to_s + '+' + addSpace('-', cellLength).to_s + '+' + addSpace('-', cellLength).to_s
      end
      (0..col - 1).each do |j|
        line += '|' if j.positive && j < col
        line += addSpace(' ', (cellLength / 2).floor).to_s
        line += (arr[i][j]).to_s
        line += addSpace(' ', (cellLength / 2).floor).to_s
      end
      ans += "\n"
      ans += line
    end
    ans
  end
end
