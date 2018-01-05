require_relative 'user.rb'

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
    @students_array.push('Pick any group you like!') if @students_array.size.odd?
    number_of_todays_pairs = @students_array.size / 2

    1.times do |index|
      @days[index] = []
      number_of_todays_pairs.times do |number_index|
        @days[index] << [@students_array[number_index], @students_array.reverse[number_index]]
      end
      @students_array = [@students_array[0]] + @students_array[1..-1].rotate(-1)
    end
  end

end
