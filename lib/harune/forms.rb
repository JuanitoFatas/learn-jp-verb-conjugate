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
      when "か", "い"
        base + "きます"
      when "およ"
        base + "ぎます"
      when "し"
        base + "にます"
      when "はな"
        base + "します"
      when "よ"
        base + "みます"
      else
        base + "ります"
      end
    end

    def conjunctive
      case base
      when "ま"
        base + "ち"
      when "か", "い"
        base + "き"
      when "およ"
        base + "ぎ"
      when "し"
        base + "に"
      when "はな"
        base + "し"
      when "よ"
        base + "み"
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
      when "か", "い"
        base + "かない"
      when "およ"
        base + "がない"
      when "し"
        base + "なない"
      when "はな"
        base + "さない"
      when "よ"
        base + "まない"
      else
        "ない"
      end
    end

    def ta
      case base
      when "か"
        base + "いた"
      when "およ"
        base + "いだ"
      when "し", "よ"
        base + "んだ"
      when "はな"
        base + "した"
      else
        base + "った"
      end
    end

    def te
      case base
      when "か"
        base + "いて"
      when "し", "よ"
        base + "んで"
      when "およ"
        base + "いで"
      when "はな"
        base + "して"
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
        when "しぬ" then "し"
        when "およぐ" then "およ"
        when "いく" then "い"
        when "はなす" then "はな"
        when "よむ" then "よ"
        else
          hiragana.split("る").first
        end
      end
    end
  end
end
