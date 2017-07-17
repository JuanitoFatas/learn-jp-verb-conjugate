require_relative "kanji"

class Harune
  class Forms
    def initialize(verb)
      @verb = verb
    end

    def dictionary
      base + "る"
    end

    def masu
      base + "ります"
    end

    def conjunctive
      base + "り"
    end

    def not
      if base == "つく"
        base + "らない"
      else
        "ない"
      end
    end

    def ta
      base + "った"
    end

    def te
      base + "って"
    end

    private
    attr_reader :verb

    def v
      verb.split("る").first
    end

    def base
      @_base ||= Kanji.lookup(v)
    end
  end
end
