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

  def create_person(persons)
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
      persons << student
      puts 'Student created!'
    when 2
    else
      puts 'Invalid option'
    end
  end
end

def main
  app = App.new
  books = []
  persons = []

  loop do
    puts '1. Create a book'
    puts '2. List all books'
    puts '3. Create a person'
    print 'Choose an option: '
    option = gets.chomp.to_i
    case option
    when 1
      app.create_book(books)
    when 2
      app.list_all_books(books)
    when 3
      app.create_person(persons)
    when 0
      break
    else
      puts 'invalid option'
    end
  end
end

main
# require './app.rb'
