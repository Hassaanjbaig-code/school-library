require_relative './book'
require_relative './person'
require_relative './rentel'
require_relative './student'
require_relative './teacher'
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
        if @books.length == 0
            puts 'There are no books'
        else
            @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
        end
        puts 'For go back to menu press 0'
        input = gets.chomp
        if input == '0'
            display
        else
            puts 'Please choose a valid option'
        end
    end

    def list_people
        if @people.length == 0
            puts 'There are no people'
        else
            @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
        end
        puts 'For go back to menu press 0'
        input = gets.chomp
        if input == '0'
            display
        else
            puts 'Please choose a valid option'
        end
    end
    

  def create_book
    print 'Title of the book: '
    title = gets.chomp
    print 'Author of the book: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    display
  end

  def create_person
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
    display
  end

  def create_student
    print 'Add name'
    name = gets.chomp
    print 'Add age'
    age = gets.chomp
    print 'Add a classroom'
    classroom = gets.chomp
    print 'Add parent permission (Yes or No)'
    parent_permission = gets.chomp
    permission = case parent_permission
                 when 'Yes'
                   true
                 when 'No'
                   false
                 else
                   'Please choose a valid option (Yes or No)'
                 end
    student = Student.new(classroom, age, name: name, parent_permission: permission)
    @people << student
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Add name'
    name = gets.chomp
    print 'Add age'
    age = gets.chomp
    print 'Add a specialization'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher
    puts 'Teacher created successfully'
  end
  def create_rental
    puts 'Select a book that you want to rent by name of book'
    book = gets.chomp
    puts 'Select a person to rent the book by name of person'
    person = gets.chomp
    puts 'Add date of rental'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'Rental created successfully'
  end
end

app = App.new
app.display
