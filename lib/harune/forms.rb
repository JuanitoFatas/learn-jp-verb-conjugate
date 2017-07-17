require_relative "kanji"

class Harune
  class Forms
    def initialize(verb)
      @verb = verb
    end

    def dictionary
      hiragana
    end

    def masu
      case base
      when "ま"
        base + "ちます"
      else
        base + "ります"
      end
    end

    def conjunctive
      case base
      when "ま"
        base + "ち"
      else
        base + "り"
      end
    end

    def not
      case base
      when "つく"
        base + "らない"
      when "ま"
        base + "たない"
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

    def hiragana
      return @_hiragana if defined?(@_hiragana)

      @_hiragana = begin
        verb.chars.map do |char|
          Kanji.to_hiragana(char)
        end.join
      end
    end

    def base
      @_base ||= begin
        case hiragana
        when "まつ" then "ま"
        when "かく" then "か"
        else
          hiragana.split("る").first
        end
      end
    end
  end
end
