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
    @guess = params[:guess]
    @num = (rand(10) + 1).to_s
    if @guess == ""
      return @answer = "Please enter a valid number!"
    elsif @guess != @num
      return @answer = "You guessed #{@guess}, but the computer's number was #{@num}..."
    else
      return @answer = "The computer's number is also #{@guess}! You guessed the correct number!"
    end
  end
  helper_method :guessing_game

  def largest_prime_check
    @input = params[:number].to_i
    prime = @input
    (2..Math.sqrt(@input).to_i).each do |i|
      break if prime <= 1
      prime /= i while (prime > i && prime % i == 0)
    end
    return @answer = "The largest prime factor of #{@input} is #{prime}!"
  end

  def dice_roll_check
    @roll = rand(6) + 1
    case
      when @roll == 1 
        return @answer = { "roll": @roll, "image": "https://upload.wikimedia.org/wikipedia/commons/2/2c/Alea_1.png" }
      when @roll == 2 
        return @answer = { "roll": @roll, "image": "https://upload.wikimedia.org/wikipedia/commons/b/b8/Alea_2.png" }
      when @roll == 3 
        return @answer = { "roll": @roll, "image": "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alea_3.png" }
      when @roll == 4 
        return @answer = { "roll": @roll, "image": "https://upload.wikimedia.org/wikipedia/commons/8/8d/Alea_4.png" }
      when @roll == 5 
        return @answer = { "roll": @roll, "image": "https://upload.wikimedia.org/wikipedia/commons/5/55/Alea_5.png" }
      when @roll == 6 
        return @answer = { "roll": @roll, "image": "https://upload.wikimedia.org/wikipedia/commons/f/f4/Alea_6.png" }
    end
  end

end
