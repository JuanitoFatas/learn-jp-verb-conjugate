class Verb
  def positive
    raise NotImplementedError
  end

  def negative
    raise NotImplementedError
  end

  def past
    raise NotImplementedError
  end

  def past_negative
    raise NotImplementedError
  end
end

class UVerb < Verb
  def initialize(verb)
    @verb = verb
  end

  def conjugate
    {
      positive: "かいます",
      negative: "かいません",
      past: "かいました",
      past_negative: "かいませんでした"
    }
  end
end

class RuVerb < Verb
  def initialize(verb)
    @verb = verb
  end

  def conjugate
    {
      positive: "おきます",
      negative: "おきません",
      past: "おきました",
      past_negative: "おきませんでした"
    }
  end
end

class VerbClassifier
  def initialize(verb)
    @verb = verb
  end

  def run
    if verb.end_with?("う")
      UVerb.new(verb)
    else
      RuVerb.new(verb)
    end
  end

  private
  attr_reader :verb
end

class Harune
  def initialize(verb)
    @verb = VerbClassifier.new(verb).run
  end

  def conjugate
    verb.conjugate
  end

  private
  attr_reader :verb
end

puts Harune.new("買う").conjugate
puts Harune.new("起きる").conjugate
puts Harune.new("食べる").conjugate
