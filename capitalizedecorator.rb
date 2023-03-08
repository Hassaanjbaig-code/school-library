require_relative './basedecorate.rb'

class Capitalize < Decorate
    def correct_name
        @nameable.correct_name.capitalize
    end
end
