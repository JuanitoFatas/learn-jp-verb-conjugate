require_relative "harune/forms"

class Harune
  def self.conjugate(verb)
    new(verb).conjugate
  end
  def initialize(verb)
    @verb = verb
  end

  def conjugate
    Forms.new(verb)
  end

  private
  attr_reader :verb
end
