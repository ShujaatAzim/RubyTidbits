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
      return @answer = "YES! '#{@string}' is a palindrome!"
    else
      return @answer = "NO! '#{@string}' is NOT a palindrome!"
    end
  end

  def guessing_game_check
    @guess = params[:guess]
    @num = (rand(10) + 1).to_s
    if @guess != @num
      return @answer = "You guessed #{@guess}, but the computer's number was #{@num}..."
    else
      return @answer = "The computer's number is also #{@guess}! You guessed the correct number! You Win!"
    end
  end

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
    @dice_number = params[:dice_number].to_i
    dice_images = {
      1 => "https://upload.wikimedia.org/wikipedia/commons/2/2c/Alea_1.png",
      2 => "https://upload.wikimedia.org/wikipedia/commons/b/b8/Alea_2.png",
      3 => "https://upload.wikimedia.org/wikipedia/commons/2/2f/Alea_3.png",
      4 => "https://upload.wikimedia.org/wikipedia/commons/8/8d/Alea_4.png",
      5 => "https://upload.wikimedia.org/wikipedia/commons/5/55/Alea_5.png",
      6 => "https://upload.wikimedia.org/wikipedia/commons/f/f4/Alea_6.png"
    }

    if @dice_number == 1
      @roll = rand(6) + 1
      return @answer = { 
        "dice_number": @dice_number, 
        "roll": @roll, 
        "image": dice_images[@roll] 
      }
    else
      @roll1 = rand(6) + 1
      @roll2 = rand(6) + 1
      return @answer = { 
        "dice_number": @dice_number, 
        "roll1": @roll1, 
        "roll2": @roll2, 
        "total": @roll1 + @roll2, 
        "image1": dice_images[@roll1], 
        "image2": dice_images[@roll2] 
      }
    end
  end

  def coin_flip_check
    @flip = rand(2) + 1
    case
      when @flip == 1
        return @answer = { 
          "flip": "heads", 
          "image": "https://random-ize.com/coin-flip/us-dime/us-dime-front.jpg" 
        }
      when @flip == 2
        return @answer = { 
          "flip": "tails", 
          "image": "https://random-ize.com/coin-flip/us-dime/us-dime-back.jpg" 
        }
    end
  end


end
