# frozen_string_literal: false

require_relative 'computer'
require_relative 'game'
require_relative 'items'

class Player
  attr_reader :hum_guess

  def initialize
    @hum_guess = []
  end
end
