require_relative 'computer'
require_relative 'game'
require_relative 'human'



class Answer
  attr_reader :color
  def initialize
    @color = ["purple", "blue", "green", "pink", "black", "grey"].shuffle.sample(4)
  end
  def answer_key
    @color
  end
end

#a way to call a sample from each array
#answer = Answer.new
#puts answer
#puts answer.color