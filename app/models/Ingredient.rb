class Ingredient
  attr_accessor :name, :allergens

  @@all = []

  def initialize(name)
    @name = name
    #belongs to RecipeIngredient
    @allergens = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_allergens(allergen)
    @allergens << allergen
  end

  def most_common_allergen
    User.all.select do |user|
       @allergens << user.allergen
    end
    sorted_allergens = allergens.group_by do |allergen|
      { allergen => allergens.count(allergen) }
    end
    most_common = sorted_allergens.max_by {|key, value| value}
  end
end
