class User
  attr_accessor :name, :recipes, :allergens, :recipecards

  @@all = []
  def initialize(name, recipecards= [])
    @name = name
    @allergens = []
    @recipecards = recipecards
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    @recipes = @recipecards.map do |recipecard|
      recipecard.recipe
    end.uniq
  end

  def add_recipe_card(recipe, date, rating)
    new_recipe_card = RecipeCard.new(self, recipe, date, rating)
    @recipecards << new_recipe_card
    @recipecards
  end

  def declare_allergen(allergen)
    new_allergen = Allergy.new(user: self, name: allergen, ingredient: self.recipes )
    @allergens << new_allergen
    @allergens
  end

  def top_three_recipes
    ratings = @recipecards.group_by do |recipecard|
      recipecards.rating
    end
    ratings[0..2]
  end

  def most_recent_recipe
    @recipecards.max_by do |recipecard|
      recipecard.date
    end
  end
end
