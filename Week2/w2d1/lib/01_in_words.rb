module Ones
  def ones_place(digit)
    return "zero" if digit == 0
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

module Magnitudes
  def magnitudes(digits)
    return " hundred" if digits == 100
    return " thousand" if digits == 1000
    return " million" if digits == 1000000
    return " billion" if digits == 1000000000000
    return " trillion" if digits == 1000000000000000
  end
end

class Fixnum
  include Ones
  include Tens
  include Magnitudes

  def in_words
    in_words = ""

    if self < 10
      return ones_place(self)
    elsif self < 100
      in_words = two_digits(self)
      in_words.slice!(" zero") if self.to_s[-1] == "0"
      return in_words
    elsif self < 100
      prefix = self.to_s[0].in_words
      suffix = magnitudes(self)
      return prefix + suffix
    end
  end

  def find_magnitude(digits)
    return 100 if digits % 100 < 100
  end

end














=begin
  def in_words
    in_words = []
    split_by_threes = []
    group_of_three = ""

    self.to_s.reverse.chars.each do |i|         # Start at end of integer array and go backwards
      group_of_three += self.to_s[i]            # Add digit to group_of_three array
      if group_of_three.length == 3             # Once it reaches 3 digits
        split_by_threes.unshift(group_of_three) # Add to split_by_threes array
        group_of_three == ""                    # And reset group_of_three
      end
    end

    split_by_threes << group_of_three # unless group_of_three.empty? # pushes last group of 2 or 1

    puts split_by_threes

    split_by_threes.each do |grouping|
      grouping.chars.each_with_index do |digit, i|
        if grouping.length == 3
          if i == 0 # Hundreds place
            in_words << hundreds_place(digit)
          elsif i == 1 # Tens place
            if digit == 1

            in_words << tens_place(digit)
            end
          else # Ones place
            in_words << ones_place(digit)
          end
        end
      end
    end
    in_words
  end
end
=end
