require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  @@count = 0
  

def initialize(name = nil)
  @name = name
  @species = "human"
  @@all << self
  @@count += 1 
  @pets = { :dogs => [], :cats => [] }
end

def say_species
  return "I am a #{@species}." 
end 

def self.all
  @@all
end

def self.count
  @@count
end

def self.reset_all
  @@all.clear
  @@count = 0
end

def cats 
  Cat.all.select {|cat| cat.owner == self}
end 

def dogs 
  Dog.all.select {|dog| dog.owner == self}
end 

def buy_cat(name)
  new_cat = Cat.new(name, self)
  @pets[:cats] << new_cat
end

def buy_dog(name)
  new_dog = Dog.new(name, self)
  @pets[:dogs] << new_dog
end

def walk_dogs
    @pets.collect do |species, instances|
      if species == :dogs
        instances.collect do |dog|
          dog.mood = "happy"
        end
      end
    end
  end

def feed_cats
  self.pets[:cats].map {|cat| cat.mood = "happy"}
end

end
  