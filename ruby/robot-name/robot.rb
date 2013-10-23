# * Random names means a risk of collisions. Make sure the same name is never used twice. Feel free to introduce additional tests.
require 'pry'
class Robot
  attr_accessor :name
  def initialize
    @name = ""
    @assigned_names = []
  end

  def name
    # need to throw an exception if the name already 
    if @name == "" && !@assigned_names.include?(@name)
      letters = ('A'..'Z').random_selection + ('A'..'Z').random_selection
      numbers = (100..999).random_selection.to_s
      @name = letters + numbers
      @assigned_names << @name
      @name
    else
      raise 'Names must be unique, try again'
    end
  end

  def reset
    @name = ""
  end
end

class Range
  def random_selection
    to_a.sample
  end
end
