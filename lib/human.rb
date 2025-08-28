require_relative 'computer'
require_relative 'game'
require_relative 'items'

class Player
  attr_reader :hum_guess
  def initialize
    @hum_guess = []
  end
  def hum_guess

    @hum_guess
  end
end