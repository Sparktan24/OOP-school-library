#!/usr/bin/env ruby

require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'

class App
  def create_book(books)
    puts 'Enter book details:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    books << book
    puts 'Book created successfully!'
  end

  def list_all_books(books)
    puts 'List of all books: '
    books.each { |book| puts "Title: #{book.title}, Author #{book.author}" }
  end

  def create_person(people)
    puts 'Do you want to create a student(1) or a teacher(2)'
    option = gets.chomp.to_i
    case option
    when 1
      puts 'Enter student details: '
      print 'Name: '
      name = gets.chomp
      print 'Age '
      age = gets.chomp.to_i
      print 'Has parents permission?[Y/N]'
      parent_permission = gets.chomp.downcase
      case parent_permission
      when 'y'
        parent_permission = true
      when 'n'
        parent_permission = false
      else 
        puts 'Invalid option'
        return
      end
      print 'Choose classroom: '
      classroom = Classroom.new
      classroom.label = 'A-10'
      student = Student.new(age, classroom, name, parent_permission: parent_permission)
      people << student
      puts 'Student created!'

    when 2
      puts 'Enter teacher details: '
      print 'Name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp.to_i
      print 'Specilization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      people << teacher
      puts 'Teacher created!'

    else
      puts 'Invalid option'
    end
  end

  def list_all_people(people)
    puts 'List of all people: '
    people.each { |person| puts "ID: #{person.id}, Name: #{person.name} Age: #{person.age}" }
  end
end

def main
  app = App.new
  books = []
  people = []

  loop do
    puts '1. Create a book'
    puts '2. List all books'
    puts '3. Create a person'
    puts '4. list all people'
    print 'Choose an option: '
    option = gets.chomp.to_i
    case option
    when 1
      app.create_book(books)
    when 2
      app.list_all_books(books)
    when 3
      app.create_person(people)
    when 4
      app.list_all_people(people)
    when 0
      break
    else
      puts 'invalid option'
    end
  end
end

main
# require './app.rb'
