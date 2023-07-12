require_relative 'app'

class Menu
  def initialize
    @app = App.new
    @options = menu_options
  end

  def menu_render
    loop do
      display_menu
      option = option_choice
      if option.zero?
        @app.save_books(@app.books)
        @app.save_people(@app.people)
        @app.save_rentals(@app.rentals)
      end

      break if option.zero?

      print 'Choose an option: '
      execute_chosen_option(option)
    end
  end

  def menu_options
    [
      { option: ListAllBooksOption.new(@app), description: 'List all books' },
      { option: ListAllPeopleOption.new(@app), description: 'List all people' },
      { option: CreatePersonOption.new(@app), description: 'Create a person' },
      { option: CreateBookOption.new(@app), description: 'Create a book' },
      { option: CreateRentalOption.new(@app), description: 'Create a rental' },
      { option: ListRentsPerIdOption.new(@app), description: 'List rents per person ID' }
    ]
  end

  def display_menu
    puts 'Menu:'
    @options.each_with_index { |item_option, index| puts "#{index + 1}. #{item_option[:description]}" }
    puts '0. To exit'
  end

  def option_choice
    print 'Choose an option: '
    gets.chomp.to_i
  end

  def execute_chosen_option(option)
    selected_option = @options[option - 1]
    if selected_option.nil?
      puts 'Not a valid option'
    else
      selected_option[:option].execute
    end
  end
end

class MenuOptions
  def initialize(app)
    @app = app
    @name = self.class.name
  end

  def execute
    raise NotImplementedError, 'Subclasses must implement the execute method'
  end
end

class ListAllBooksOption < MenuOptions
  def execute
    @app.list_all_books
  end
end

class ListAllPeopleOption < MenuOptions
  def execute
    @app.list_all_people
  end
end

class CreatePersonOption < MenuOptions
  def execute
    @app.create_person
  end
end

class CreateBookOption < MenuOptions
  def execute
    @app.create_book
  end
end

class CreateRentalOption < MenuOptions
  def execute
    @app.create_rental
  end
end

class ListRentsPerIdOption < MenuOptions
  def execute
    @app.list_rents_per_id
  end
end
