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
      when "か"
        base + "きます"
      else
        base + "ります"
      end
    end

    def conjunctive
      case base
      when "ま"
        base + "ち"
      when "か"
        base + "き"
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
      when "か"
        base + "かない"
      else
        "ない"
      end
    end

    def ta
      if base == "か"
        "かいた"
      else
        base + "った"
      end
    end

    def te
      if base == "か"
        "かいて"
      else
        base + "って"
      end
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
