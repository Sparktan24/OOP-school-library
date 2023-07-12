require 'json'
require_relative 'book'
# require 'pry'

module DataJson
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

  def save_people(people)
    json_data = people.map(&:to_hash)
    File.write('./json/people.json', JSON.pretty_generate(json_data))
  end

  def load_people(people)
    return unless File.exist?('./json/people.json')

    people_data = JSON.parse(File.read('./json/people.json'))
    people_data.each do |person_data|
      if person_data['type'] == 'Student'
        load_student(person_data, people)
      elsif person_data['type'] == 'Teacher'
        load_teacher(person_data, people)
      end
    end
  end

  def load_student(student_data, people)
    name = student_data['name']
    age = student_data['age']
    parent_permission = student_data['parent_permission']
    classroom_data = student_data['classroom']

    classroom = nil
    if classroom_data
      classroom_label = classroom_data['label']
      classroom = Classroom.new(classroom_label)
      classroom_data['students'].each do |student|
        student_name = student['name']
        student_age = student['age']
        student_parent_permission = student['parent_permission']
        student_instance = Student.new(student_age, classroom, student_name, parent_permission: student_parent_permission)
        classroom.add_student(student_instance)
      end
    end

    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    people << student
  end

  def load_teacher(teacher_data, people)
    name = teacher_data['name']
    age = teacher_data['age']
    specialization = teacher_data['specialization']
    teacher = Teacher.new(age, specialization, name)
    people << teacher
  end
end
