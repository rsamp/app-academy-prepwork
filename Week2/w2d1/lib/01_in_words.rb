module Ones
  def ones_place(digit)
    return "" if digit == 0
    return "one" if digit == 1
    return "two" if digit == 2
    return "three" if digit == 3
    return "four" if digit == 4
    return "five" if digit == 5
    return "six" if digit == 6
    return "seven" if digit == 7
    return "eight" if digit == 8
    return "nine" if digit == 9
  end
end

module Tens
  def two_digits(digits)
    return teens(digits) if digits >= 10 && digits < 20
    return tens_place(digits)
  end

  def teens(digits)
    return "ten" if digits == 10
    return "eleven" if digits == 11
    return "twelve" if digits == 12
    return "thirteen" if digits == 13
    return "fourteen" if digits == 14
    return "fifteen" if digits == 15
    return "sixteen" if digits == 16
    return "seventeen" if digits == 17
    return "eighteen" if digits == 18
    return "nineteen" if digits == 19
  end

  def tens_place(digits)
    str = ""
    digits_arr = digits.to_s.split("")
    tens_digit = digits_arr[0].to_i
    ones_digit = digits_arr[-1].to_i
    str = "twenty" if tens_digit == 2
    str = "thirty" if tens_digit == 3
    str = "forty" if tens_digit == 4
    str = "fifty" if tens_digit == 5
    str = "sixty" if tens_digit == 6
    str = "seventy" if tens_digit == 7
    str = "eighty" if tens_digit == 8
    str = "ninety" if tens_digit == 9
    return "#{str} #{ones_place(ones_digit)}".chomp(" ")
  end
end

module Hundreds
  def hundreds_place(digits)
    "#{ones_place(digit)} hundred"
    # digits_arr = digits.to_s.split("")
    # hundreds_digit = digits_arr[0].to_i
    # remaining_digits = digits_arr[1..digits_arr.length-1]
    # return "#{ones_place(hundreds_digit) if hundreds_digit != 0} hundred #{two_digits(remaining_digits.join.to_i) if remaining_digits.join.to_i != 0}".chomp(" ")
  end
end
=begin
module Thousands
    def thousands_place(digits)
        digits_arr = digits.to_s.split("")
        thousands_digit = digits_arr[0].to_i
        remaining_digits = digits_arr[1..digits_arr.length-1]
        return "#{ones_place(thousands_digit) if thousands_digit != 0} thousand #{three_digits(remaining_digits.join.to_i) if remaining_digits.join.to_i != 0}".chomp(" ")
    end
end
=end
class FixNum
  include Ones
  include Tens
  include Hundreds
  include Thousands

  def in_words
    in_words = []
    split_by_threes = []
    group_of_three = ""

    [-1..(self.to_s.length*-1)] do |i|
      group_of_three += self.to_s[i]
      if group_of_three.length == 3
        split_by_threes.unshift(group_of_three)
        group_of_three == ""
      end
    end
    split_by_threes.unshift(group_of_three) unless group_of_three.empty? # pushes last group of 2 or 1

    split_by_threes.each do |grouping|
      grouping.chars.each_with_index do |digit, i|
        if grouping.length == 3
          if i == 0 # Hundreds place
            in_words << hundreds_place(digit)
          elsif i == 1 # Tens place
            if digit == 1
              
            in_words << tens_place(digit)
          end
        end
      end
    end
  end
end
