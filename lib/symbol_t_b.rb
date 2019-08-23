# frozen_string_literal: true

class Symbol_t_b
  # This class helps to center tekst
  attr_reader :sentence
  attr_reader :cover_symb
  attr_reader :neutral_symb
  attr_reader :table_size
  attr_reader :padding

  attr_writer :sentence
  attr_writer :cover_symb
  attr_writer :neutral_symb
  attr_writer :table_size
  attr_writer :padding

  def initialize(sentence, cover_symb, neutral_symb, table_size, padding)
    @sentence = sentence
    @cover_symb = cover_symb.nil? ? '*' : cover_symb
    @neutral_symb = neutral_symb.nil? ? ' ' : neutral_symb
    @table_size = table_size.nil? ? 32 : table_size
    # @table_size = table_size.nil? ? 32 : ( ((table_size-@sentence.length)%2==1) ? (table_size + 1) : table_size)
    @padding = table_size.nil? ? 1 : padding
  end

  def print_symbol_table
    len = @sentence.length
    margin_l = (@table_size - len - (2 * @padding)) / 2
    sentence_to_print = ''
    (0..(margin_l + @padding)).each do |i|
      sentence_to_print += if i == margin_l + @padding
                             # yield(margin_right)
                             @sentence
                           elsif i >= margin_l && i < margin_l + @padding
                             @neutral_symb
                           else
                             @cover_symb
                           end
    end
    ((margin_l + @padding + len)..(2 * margin_l + 2 * @padding + len - 1)).each do |i|
      if (margin_l + @padding + len) <= i && i < (margin_l + 2 * @padding + len)
        sentence_to_print += @neutral_symb
      else
        sentence_to_print += @cover_symb
      end
    end
    sentence_to_print += @cover_symb if sentence_to_print.length < @table_size
    yield(sentence_to_print)
  end
end
