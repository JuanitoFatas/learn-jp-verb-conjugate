class Harune
  class Forms
    def initialize(base)
      @base = base
    end

    def dictionary
      "ある"
    end

    def masu
      "あります"
    end

    def conjunctive
      "あり"
    end

    def not
      "ない"
    end

    def ta
      "あった"
    end

    def te
      "あって"
    end

    private
    attr_reader :base
  end
end
