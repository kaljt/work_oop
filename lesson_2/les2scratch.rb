class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    full_name = name.split
    @first_name = full_name.first
    @last_name = full_name.size > 1 ? full_name.last : ''
  end

  def name
    @name = @first_name + " " + @last_name
  end

  def name=(name_string)
    self.first_name = name_string.split(" ").first
    self.last_name = name_string.split(" ").last
  end

  def to_s
    name
  end

end

#bob = Person.new('Robert')
#puts bob.name                  # => 'Robert'
#puts bob.first_name            # => 'Robert'
#puts bob.last_name             # => ''
#bob.last_name = 'Smith'
#puts bob.name                  # => 'Robert Smith'

#bob.name = "John Adams"
#puts bob.first_name            # => 'John'
#puts bob.last_name

#bob = Person.new('Robert Smith')
#rob = Person.new('Robert Smith')
#
#puts bob.inspect
#puts rob.inspect

#puts bob.name == rob.name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
