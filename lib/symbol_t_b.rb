# frozen_string_literal: true

class SymbolTB
  attr_reader :sentence
  attr_reader :cover_symb
  attr_reader :neutral_symb
  attr_reader :table_size
  attr_reader :padding

  attr_writer :sentence
  attr_writer :cover_symb
  attr_writer :neutral_symb
  attr_writer :table_size
  attr_reader :padding

  def initialize(sentence, cover_symb, neutral_symb, table_size, padding)
    @sentence = sentence
    @cover_symb = cover_symb.nil? ? '*' : cover_symb
    @neutral_symb = neutral_symb.nil? ? ' ' : neutral_symb
    @table_size = table_size.nil? ? 32 : table_size
    # @table_size = table_size.nil? ? 32 : ( ((table_size-@sentence.length)%2==1) ? (table_size + 1) : table_size)
    @padding = table_size.nil? ? 1 : padding
  end

  def print__symbol__table
    length = @sentence.length
    margin_left = (@table_size - length - (2 * @padding)) / 2
    sentence_to_print = ''
    (0..(margin_left + @padding)).each do |i|
      sentence_to_print += if i == margin_left + @padding
                             # yield(margin_right)
                             @sentence
                           elsif i >= margin_left && i < margin_left + @padding
                             @neutral_symb
                           else
                             @cover_symb
                           end
    end
    ((margin_left + @padding + length)..(2 * margin_left + 2 * @padding + length - 1)).each do |i|
      if (margin_left + @padding + length) <= i && i < (margin_left + 2 * @padding + length)
        sentence_to_print += @neutral_symb
      else
        sentence_to_print += @cover_symb
      end
    end
    sentence_to_print += @cover_symb if sentence_to_print.length < @table_size
    yield(sentence_to_print)
  end
end
