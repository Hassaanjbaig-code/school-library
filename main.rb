require_relative './app'

class Main
  def run
    app = App.new
    loop do
      display(app)
    end
  end

  def display(app)
    puts 'Welcome to our app'
    list = Array[
        '1 - List all books',
        '2 - List all people',
        '3 - Create a person',
        '4 - Create a book',
        '5 - Create a rental',
        '6 - List all rentals for a given person id',
        '7 - Exit'
    ]
    list.each { |item| puts item }
    puts 'Please choose an option by enterin a number:'
    input = gets.chomp
    get_list(input, app)
  end

  # rubocop:disable Metrics/CyclomaticComplexity

  def get_list(number, app)
    case number
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rentals
    when '7'
      exit
    else
      puts 'Please choose a valid option'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
end

main = Main.new
main.run
