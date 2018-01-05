# require_relative 'user.rb'

class Pair
   attr_reader :days

  def initialize
    @days = {}
    set_students
    @students_array = []
    email_array
    pairing_up
  end

  def set_students
    users = User.all.shuffle
    @students = users.select { |user| user.admin == false }
  end

  def email_array
    @students.each do |student|
      @students_array << student.email
    end
  end


  private

  def pairing_up
    @students_array.push(nil) if @students_array.length.odd?
    days = 1
    number_of_days = @students_array.length / 2

    days.times do |index|
      @days[index+1] = []
      number_of_days.times do |number_index|
        @days[index+1] << [@students_array[number_index], @students_array.reverse[number_index]]
      end
      @students_array = [@students_array[0]] + @students_array[1..-1].rotate(-1)
    end
  end

end
