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
end

def main
  app = App.new
  books = []

  loop do
    puts '1. Create a book'
    puts '2. List all books'
    print 'Choose an option: '
    option = gets.chomp.to_i
    case option
    when 1
      app.create_book(books)
    when 2
      app.list_all_books(books)
    when 0
      break
    else
      puts 'invalid option'
    end
  end
end

main
# require './app.rb'
