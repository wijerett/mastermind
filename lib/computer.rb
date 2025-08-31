# frozen_string_literal: false

require_relative 'human'
require_relative 'game'
require_relative 'items'

class Comp
  def initialize
    @comp_guess = %w[purple blue green pink black grey].shuffle.sample(4)
  end

  attr_reader :comp_guess
end

# comp = Comp.new
# puts comp.comp_guess
