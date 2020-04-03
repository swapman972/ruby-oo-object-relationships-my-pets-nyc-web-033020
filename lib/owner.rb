class Owner
  # code goes here
  @@all = []
  attr_reader :name, :species
  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    p "I am a #{self.species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select {|key| key.owner == self}
  end
  def dogs
    Dog.all.select {|key| key.owner == self}
  end
  def buy_cat(name)
    Cat.new(name, self)
  end
  def buy_dog(name)
    Dog.new(name, self)
  end
  def walk_dogs
    dogs.select {|key| key.mood = "happy"}
  end

  def feed_cats
    cats.select {|key| key.mood = "happy"}
  end

  def sell_pets
    cats.select do |key| 
      key.mood = "nervous" 
      key.owner =nil
    end
    dogs.select do |key| 
      key.mood = "nervous" 
      key.owner =nil
    end
  end

  def list_pets
    all_pets = []
    cats.select {|key| all_pets << key}
    dogs.select {|key| all_pets << key}
    all_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end