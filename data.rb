require 'json'
require_relative 'book'
# require 'pry'

module Data_json

  def load_books(books)
    return unless File.exist?('./json/books.json')
    books_data = JSON.parse(File.read('./json/books.json'))
    books_data.each do |book|
      books << Book.new(book['title'], book['author'])
    end       
  end

  def save_books(books)
    # binding.pry
    # json = books.to_json
    File.write('./json/books.json', JSON.pretty_generate(@books.map(&:to_json)))
    
  end
end
