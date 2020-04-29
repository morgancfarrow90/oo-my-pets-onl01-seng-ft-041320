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
    self.dogs.map {|dog| dog.mood = "happy"}
  end 

def feed_cats
  self.cats.map {|cat| cat.mood = "happy"}
end

def sell_pets
  self.cats.map {|cat| cat.mood = "nervous" cat.owner = nil}
  
  self.dogs.map {|dog| dog.mood = "nervous" dog.owner = nil}
end
end
  