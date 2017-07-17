# frozen_string_literal: true

class Harune
  class Kanji
    def self.lookup(kanji)
      new(kanji).lookup
    end

    def initialize(kanji)
      @kanji = kanji
    end

    def lookup
      KANJIS.fetch(kanji) { kanji }
    end

    private
    attr_reader :kanji

    KANJIS = { "作" => "つく" }
    private_constant :KANJIS
  end
end
