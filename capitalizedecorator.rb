require_relative './basedecorate'

class Capitalize < Decorate
  def correct_name
    @nameable.correct_name.capitalize
  end
end
