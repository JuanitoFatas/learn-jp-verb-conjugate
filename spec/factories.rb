# frozen_string_literal: true

module HaruneHelper
  class Form
    attr_reader :base, :dictionary, :masu, :conjunctive, :not, :ta, :te
    def initialize(base, forms = {})
      @base = base
      @dictionary = forms["dictionary"]
      @masu = forms["masu"]
      @conjunctive = forms["conjunctive"]
      @not = forms["not"]
      @ta = forms["ta"]
      @te = forms["te"]
    end
  end

  class Polite
    attr_reader :base, :postive, :negative, :past, :past_negative
    def initialize(base, forms = {})
      @base = base
      @postive = forms["postive"]
      @negative = forms["negative"]
      @past = forms["past"]
      @past_negative = forms["past_negative"]
    end
  end

  class Usual
    attr_reader :base, :postive, :negative, :past, :past_negative
    def initialize(base, forms = {})
      @base = base
      @postive = forms["postive"]
      @negative = forms["negative"]
      @past = forms["past"]
      @past_negative = forms["past_negative"]
    end
  end

  module FileReader
    def self.read_and_split(file)
      IO.read(file).split("\n")
    end

    def self.read_verb_file(type, group, name)
      read_and_split("spec/fixtures/#{type}/group_#{group}/#{name}")
    end

    def self.read_pattern_file(type)
      read_and_split("spec/fixtures/#{type}/format")
    end
  end

  def type_constantize(type)
    {
      "forms" => Form,
      "polite" => Polite,
      "usual" => Usual,
    }.fetch(type)
  end

  def pattern_match(patterns, values)
    patterns.zip(values).inject({}) do |verb, (form, value)|
      verb.merge!(form => value)
    end
  end

  def load_verb(type:, group:, name:)
    type_class = type_constantize(type)
    patterns = FileReader.read_pattern_file(type)
    values = FileReader.read_verb_file(type, group, name)

    type_class.new name, pattern_match(patterns, values)
  end
end

RSpec.configure do |config|
  config.include HaruneHelper
end
