module  Swim
    def swim
      'swimming!'
    end
end

class Pet
    
  def run
    'running!'
  end
  
  def jump
      'jumping!'
  end 
  
end

class Dog < Pet
  include Swim
  def speak
    'bark!'
  end
  
  def fetch
      'fetching!'
  end
  
end

class Bulldog < Dog
   def swim
     "can't swim"
   end 
end

class Cat < Pet
  def speak
    'meow'
  end
  
end

class Fish
  include Swim
end

class Person
  
  attr_reader :name, :pets
  
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
end

kitty = Cat.new
bob = Person.new('Robert')
bud = Bulldog.new
bob.pets << bud
bob.pets << kitty
bob.pets.each {|pet| puts pet.run }
bob.pets.each {|pet| puts pet.speak }