class ApplicationController < ActionController::Base

  def welcome
    render :welcome
  end

  def palindrome_check
    @string = params[:string]
    case
      when @string == ""
        return @answer = "Please enter a string."
      when @string.length == 1
        return @answer = "All single characters are, by definition, palindromes. So yes, '#{@string}' is a palindrome..."
    end
    
    reversed_letters = []
    split_string = @string.downcase.split("")
  
    @string.length.times do |letter|
      reversed_letters << split_string.pop
    end
  
    reversed_string = reversed_letters.join("")
  
    if reversed_string == @string.downcase
      return @answer = "YES! '#{@string}' IS a palindrome!"
    else
      return @answer = "NO! '#{@string}' is NOT a palindrome!"
    end
  end
  helper_method :palindrome


  def guessing_game_check
    @input = params[:string]
    @num = (rand(6) + 1).to_s
    if @input == ""
      return @answer = "Please enter a valid number!"
    elsif @input != @num
      return @answer = "You guessed #{@input}, but the computer's number was #{@num}..."
    else
      return @answer = "The computer's number is also #{@input}! You guessed the correct number!"
    end
  end
  helper_method :guessing_game

  def largest_prime_check
    @input = params[:number].to_i
    if @input > 101 
      new_number = Integer.sqrt(@input).round
    else
      new_number = @input/2
    end
  
    factors = []
    primes = []
  
    for num in (2..new_number) 
      if @input % num == 0
        factors.push(num)
      end
    end
  
    factors.each do |num|
      if (1..num).select { |d| num % d == 0 } == [1, num]
        primes.push(num)
      end
    end
    return @answer = "The largest prime factor of #{@input} is #{primes.max}!"
  end
  
end
