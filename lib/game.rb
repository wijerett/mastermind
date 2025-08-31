# frozen_string_literal: false

require_relative 'human'
require_relative 'computer'
require_relative 'items'

def choose_mode
  puts "Would you like to (1) Set the code and let the computer guess, or
          (2) Guess the code set by the computer"
  choice = gets.chomp
  case choice
  when '1'
    :human_sets
  when '2'
    :computer_sets
  else
    puts 'Invalid choice. Try again.'
    choose_mode
  end
end

# human player is guessing colors
def play_hum
  result = @answer.zip(@hum_guess).map do |actual, guess|
    if guess == actual
      'red'
    elsif @answer.include?(guess)
      'white'
    else
      'empty'
    end
  end
  p result
  result
end

def play_round_hum
  i = 0
  print "Enter 4 colors from the list with commas separating
  Purple, Blue, Green, Pink, Black, Grey\n Guess: "
  while i < 12
    i += 1
    input = gets.chomp
    guess = input.split(',').map(&:strip)
    @hum_guess = guess
    feedback = play_hum
    if feedback.all? { |peg| peg == 'red' }
      puts 'Congratulations! All are correct!'
      break
    else
      puts 'Try again'
    end
    if i == 12
      puts 'Game Over! You lose'
      break
    end
  end
end

def play_round_comp
  print "Enter your secret code (4 colors, comma-separated)
  Choose from  purple, blue, green, pink, black, grey
  Your code: "
  input = gets.chomp
  secret = input.split(',').map(&:strip)
  i = 0
  while i < 12
    i += 1
    comp = Comp.new
    guess = comp.comp_guess
    feedback = secret.zip(guess).map do |actual, guess_color|
      if guess_color == actual
        'red'
      elsif secret.include?(guess_color)
        'white'
      else
        'empty'
      end
    end
    p guess
    p feedback
    if i == 12
      puts 'Game over, you win!'
      break
    end
    if feedback.all? { |peg| peg == 'red' }
      puts 'Computer guessed correctly'
      break
    else
      puts 'Computer will try again'
    end
  end
end

class Game
  def initialize
    @answer = Answer.new.answer_key
  end

  def play
    result = @answer.zip(@comp_guess).map do |actual, guess|
      actual == guess ? 'red' : 'white'
    end
    p result
    result
  end

  def main_game
    loop do
      mode = choose_mode
      if mode == :human_sets
        play_round_comp # human sets the code, computer guesses
      else
        play_round_hum # computer sets code, human guesses
      end
      print 'Play again? (y/n): '
      break unless gets.chomp.downcase == 'y'
    end
  end
end
