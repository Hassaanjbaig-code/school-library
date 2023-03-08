require_relative './nameable.rb'

class Decorate < Nameable
    def initialize(nameable)
        @nameable =nameable
        super()
    end
    def correct_name
        @nameable.correct_name
    end
end
