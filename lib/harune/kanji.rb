# frozen_string_literal: true

require "yaml"
require "pathname"

class Harune
  class Kanji
    def self.to_hiragana(kanji)
      new(kanji).to_hiragana
    end

    def initialize(kanji)
      @kanji = kanji
    end

    def to_hiragana
      KANJIS.fetch(kanji) { kanji }
    end

    private
    attr_reader :kanji

    DATA_DIR = Pathname.new File.expand_path("data", __dir__)
    private_constant :DATA_DIR

    KANJI_DICTIONARY_PATH = DATA_DIR.join("kanjis.yml")
    private_constant :KANJI_DICTIONARY_PATH

    KANJIS = YAML.safe_load(KANJI_DICTIONARY_PATH.read)
    private_constant :KANJIS
  end
end
