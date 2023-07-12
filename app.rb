require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'data'

class App
  attr_reader :books, :people

  include DataJson

  def initialize
    @books = []
    @people = []
    @rentals = []
    load_books(@books)
    load_people(@people)
  end

  def create_book
    puts 'Enter book details:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def list_all_books
    if @books.empty?
      puts 'There is no books yet!'
    else
      puts 'List of all books: '
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author #{book.author}" }
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)'
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def create_teacher
    puts 'Enter teacher details: '
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specilization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Teacher created!'
  end

  def create_student
    puts 'Enter student details: '
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    parent_permission = obtain_parent_permission

    classroom = Classroom.new
    classroom.label = 'A-10'
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    @people << student
    puts 'Student created!'
  end

  def obtain_parent_permission
    print 'Has parents permission?[Y/N]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid option'
      obtain_parent_permission
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people yet!'
    else
      puts 'List of all people: '
      @people.each_with_index do |person, index|
        puts "#{index}) ID: #{person.id}, Name: #{person.name} Age: #{person.age}"
      end
    end
  end

  def create_rental
    puts 'Enter rental details: '
    print 'Select a number from the following '
    list_all_books
    book_index = gets.chomp.to_i
    book = @books[book_index]
    if book.nil?
      puts 'Book not found'
      return
    end

    print 'Select a number from the following '
    list_all_people
    person_index = gets.chomp.to_i
    person = @people[person_index]
    if person.nil?
      puts 'Person not found'
      return
    end

    print 'Select a date: '
    date = gets.chomp

    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created! '
  end

  def list_rents_per_id
    puts 'Enter person ID '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found'
      return
    end

    puts "Rentals for #{person.name}: "
    rentals_for_person = @rentals.select { |rental| rental.person == person }
    rentals_for_person.each { |rental| puts "Book: #{rental.book.title}, Date: #{rental.date}" }
  end
end
