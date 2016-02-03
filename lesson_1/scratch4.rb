class Person

    def initialize name
        @name = name
    end

    def get_name
        @name
    end

end

per = Person.new "Jane"

puts per.get_name
if per.respond_to?('get_name')
  puts "Sending function" + " #{per.send :get_name}"
end
