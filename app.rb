require_relative './book'
require_relative './person.rb'
require_relative './rentel.rb'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end
    def display
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
        get_list(input)
    end
    def get_list(number)
        case number
        when '1'
            list_books
        when '2'
            list_people
        when '3'
            create_person
        when '4'
            create_book
        when '5'
            create_rental
        when '6'
            list_rentals
        when '7'
            exit
        else
            puts 'Please choose a valid option'
        end
    end

    def list_books
        print 'Title of the book: '
        title = gets.chomp
        print 'Author of the book: '
        author = gets.chomp
        book = Book.new(title, author)
        @books.push(book)
        puts 'Book created successfully'
        display()
    end
    def list_people
        print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
        input = gets.chomp
        case input
        when '1'
            create_student
        when '2'
            create_teacher
        else
            puts 'Please choose a valid option'
        end
        display()
    end
    def create_person
        
    end
end

app = App.new
app.display