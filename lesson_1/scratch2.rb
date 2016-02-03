class Animal
  attr_accessor :name

  def initialize(name, type)
    @name = name
    @type = type
  end
end

class GoodDog < Animal
  def initialize(color, name, type)
    super(name, type)
    @color = color
  end
end

bruno = GoodDog.new("brown","Alex", "Collie")
p bruno.inspect
