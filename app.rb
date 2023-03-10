require_relative './book'
require_relative './person'
require_relative './rentel'
require_relative './student'
require_relative './teacher'

class App
  attr_reader :books, :people, :rentals

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

  # rubocop:disable Metrics/CyclomaticComplexity

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

  # rubocop:enable Metrics/CyclomaticComplexity

  def list_books
    if @books.empty?
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
    if @people.empty?
      puts 'There are no people'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      display
    end
    display
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
  end

  def create_student
    print 'Add name: '
    name = gets.chomp
    print 'Add age: '
    age = gets.chomp
    print 'Add a classroom: '
    classroom = gets.chomp
    print 'Add parent permission (True or False)'
    parent_permission = gets.chomp
    permission = case parent_permission.downcase
                 when 'true'
                   true
                 when 'false'
                   false
                 end
    student = Student.new(classroom, age, name, permission)
    @people << student
    puts 'Student created successfully'
    display
  end

  def create_teacher
    print 'Add name: '
    name = gets.chomp
    print 'Add age: '
    age = gets.chomp
    print 'Add a specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts 'Teacher created successfully'
    display
  end

  def create_rental
    if @books.length.positive?
      puts 'Select a book that by there number'
      @books.each_with_index do |book, index|
        puts "[#{index}] Title: #{book.title}, Author: #{book.author}"
      end
      books = gets.chomp.capitalize
      puts 'Select a person to rent the book by there number'
      @people.each_with_index do |person, index|
        puts "[#{index}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      persons = gets.chomp.capitalize
      puts 'Add date of rental [yyyy-mm-dd]]'
      date = gets.chomp
      rental = Rental.new(date, @books[books.to_i], @people[persons.to_i])
      @rentals << rental
      puts 'Rental created successfully'
      display
    else
      display
      puts 'There are no books'
    end
  end
end

def list_rentals
    @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
  puts 'Select a person to see their rentals by there id'
  rental_id = gets.chomp.to_i
  @rentals.each do |rental|
    if rental.person.id == rental_id
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}, Person: #{rental.person.name}"
    end
    display
  end
end
