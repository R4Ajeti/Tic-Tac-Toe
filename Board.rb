def example_board
    b= [[1,2,3],[4,5,6],[7,8,9]]
    b
end

def addSpace (c,n) 
    space = ""
    for a in 0..n-1
        space += c 
    end
    space
end
def print_board(arr, cl)
    if arr.nil?
        arr = [[1,2,3],[4,5,6],[7,8,9]]
    end
    row = arr.length
    col = arr[0].length
    
    cellLength = cl
    for i in 0..row-1
        line = ""
        if i>0&&i<row
            puts "#{addSpace("-",cellLength)}"+"+"+"#{addSpace("-",cellLength)}"+"+"+"#{addSpace("-",cellLength)}"
        end
        for j in 0..col-1
            if j>0&&j<col
                line = line+"|"
            end
            line += "#{addSpace(" ",(cellLength/2).floor)}"
            line += "#{arr[i][j]}"
            line += "#{addSpace(" ",(cellLength/2).floor)}"
        end
        puts line
    end
end