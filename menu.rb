require_relative 'app'

class Menu
  def initialize
    @app = App.new
  end

  def menu_render
    exit_program = false
    options = {
      1 => -> { @app.list_all_books },
      2 => -> { @app.list_all_people},
      3 => -> { @app.create_person },
      4 => -> { @app.create_book },
      5 => -> { @app.create_rental },
      6 => -> { @app.list_rents_per_id },
      0 => -> { exit_program = true },
      default: -> { puts 'Invalid option' }
    }

    loop do
      puts '1. List all books'
      puts '2. List all peple'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. list rents person(ID)'
      puts '0. To exit'
      print 'Choose an option: '
      option = gets.chomp.to_i

      options[option]&.call || options[:default]&.call
      break if exit_program
    end
  end
end
