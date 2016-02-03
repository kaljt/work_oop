class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  #def my_grade
  #  grade
  #end

  def better_grade_than?(opponent)
    grade > opponent.grade
    #self.my_grade > opponent.my_grade
  end

  protected
  def grade
    @grade
  end

end

bob = Student.new('Bob', 90)
joe = Student.new('Joe', 98)

puts "Well done, yay!" if joe.better_grade_than?(bob)
