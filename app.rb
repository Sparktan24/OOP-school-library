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
end

def main
  app = App.new
  books = []
  puts '1. Create a book'
  print 'Choose an option: '
  option = gets.chomp.to_i
  case option
  when 1
    app.create_book(books)
  else
    puts 'invalid option'
  end
end

main
# require './app.rb'
