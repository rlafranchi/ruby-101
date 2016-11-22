class Person
end

person = Person.new
puts person.to_s
# => "#<Person:0x007fd9c8968fd0>"

# Constructor
class Person

  def initialize(name)
    # instance variables are defined with @...
    @name = name
  end

end

person = Person.new("Bob")
puts person.to_s
# => <Person:0x007fd34a8d6a38>
Object.send(:remove_const, :Person)

# Getter and Setters
class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

person = Person.new
person.name = "Bob"
puts person.name
# Bob
Object.send(:remove_const, :Person)

# Similarly
# attr_accessor - defines a getter and setter like above
# attr_reader - defines only a getter
# attr_writer - defines only a setter
class Person
  attr_accessor :name
end

person = Person.new
person.name = "Bob"
puts person.name
# Bob
p person
# => #<Person:0x007fdfbb8bc890 @name="Bob">

# Everything is an Object
p Person.ancestors
# => [Person, Object, Kernel, BasicObject]

1.class
# => Integer
p Integer.ancestors
# => [Integer, Numeric, Comparable, Object, Kernel, BasicObject] 

"String".class
# => String
p String.ancestors
# => [String, Comparable, Object, Kernel, BasicObject] 

# class variables
class Person
  @@counter = 0

  def initialize
    @@counter += 1
  end

  # class methods are defined with self
  def self.counter
    @@counter
  end
end
Object.send(:remove_const, :Person)
