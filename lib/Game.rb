# frozen_string_literal: true

class Game
  # This class contain all function of the game overflow
  def weapon_confimation(weapon_p1, weapon_p2)
    if weapon_sign?(weapon_p1)
      if weapon_p1.nil?
        true
      else
        if weapon_p1.eql? weapon_p2
          false
        else
          true
        end
      end

    else
      false
    end
  end

  def weapon_sign?(weapon_p1)
    if weapon_p1.upcase.strip.eql? 'X'
      true
    elsif weapon_p1.upcase.strip.eql? 'O'
      true
    else
      false
    end
  end

  def in_array(cache, arr)
    result = false
    (0..arr.length - 1).each do |a|
      if arr[a].eql? cache
        result = true
      else
        false
      end
    end
    result
  end

  def num_to_choice(ind)
    [(ind - 1) / 3, (ind - 1) % 3]
  end

  def choice_to_num(arr)
    arr[0] * 3 + arr[1] + 1
  end

  def num_on_choices?(num, mat)
    result = false
    coords = num_to_choice(num)
    (0..mat.length - 1).each do |c|
      if mat[c][0] == coords[0] && mat[c][1] == coords[1]
        result = true
      else
        false
      end
    end
    result
  end

  def check_similarity(num, mat, type, length)
    result = false
    if type.eql? 'h'
      if (num % length).zero?
        if num_on_choices?(num - 1, mat) && num_on_choices?(num - 2, mat)
          result = true
        end
      elsif num % length == 2
        if num_on_choices?(num + 1, mat) && num_on_choices?(num - 1, mat)
          result = true
        end
      elsif num % length == 1
        if num_on_choices?(num + 1, mat) && num_on_choices?(num + 2, mat)
          result = true
        end
      end
    elsif type.eql? 'v'
      rowcheck = num / length
      if num / length < 1 || (num / length == 1 && (num % length).zero?)
        if num_on_choices?(num + 3, mat) && num_on_choices?(num + 6, mat)
          result = true
        end
      elsif num / length < 2 || (num / length == 2 && (num % length).zero?)
        if num_on_choices?(num + 3, mat) && num_on_choices?(num - 3, mat)
          result = true
        end
      elsif num / length < 3 || (num / length == 3 && (num % length).zero?)
        if num_on_choices?(num - 3, mat) && num_on_choices?(num - 6, mat)
          result = true
        end
      end
    elsif type.eql? 'd'
      if num == 1
        if num_on_choices?(num + 4, mat) && num_on_choices?(num + 8, mat)
          result = true
        end
      elsif num == 3
        if num_on_choices?(num + 2, mat) && num_on_choices?(num - 2, mat)
          result = true
        end
      elsif num == 5
        if (num_on_choices?(num + 4, mat) && num_on_choices?(num - 4, mat)) || (num_on_choices?(num + 2, mat) && num_on_choices?(num - 2, mat))
          result = true
        end
      elsif num == 7
        if num_on_choices?(num - 2, mat) && num_on_choices?(num - 4, mat)
          result = true
        end
      elsif num == 9
        if num_on_choices?(num - 4, mat) && num_on_choices?(num - 8, mat)
          result = true
        end
      end
    end
    result
  end

  def win_confirmation(num, mat)
    result = false
    choice = mat.length
    (0..choice - 1).each do |_c|
      if check_similarity(num, mat, 'h', 3) == true
        result = true
        break
      elsif check_similarity(num, mat, 'v', 3) == true
        result = true
        break
      elsif check_similarity(num, mat, 'd', 3) == true
        result = true
        break
      end
    end
    result
  end
end
