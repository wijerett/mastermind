require_relative 'human'
require_relative 'game'
require_relative 'items'



class Comp
  attr_reader :comp_guess
  def initialize
    @comp_guess = ["purple", "blue", "green", "pink", "black", "grey"].shuffle.sample(4)
  end
  def comp_guess
    #need to put red where wrong color and white where a correct one is
    @comp_guess
  end

end

#comp = Comp.new
#puts comp.comp_guess