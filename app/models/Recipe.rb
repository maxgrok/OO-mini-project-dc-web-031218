class Recipe
  attr_accessor :name, :recipeingredients, :users
  @@all = []
  @recipeingredients = []

  def initialize(name, recipeingredients)
    @name = name
    @recipeingredients = recipeingredients
    @@all << self
  end

  def self.all
    @@all
  end

    # 1) all the users associated with a specific recipe
  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def users
    recipecards.map do |recipecard|
      recipecard.user
    end
  end

  # 2) sort array by number of users per recipecard

  def self.most_popular #not working
      #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
      most_pop = self.all.max_by {|recipe| recipe.users.size}
      most_pop
  end

  def recipe_ingredients
    @recipeingredients
  end

  def allergens
    allergens = recipeingredients.select do |recipeingredient|
        recipeingredient.allergens
    end
    allergens.uniq
  end

  def add_ingredients(recipeingredient)
    @recipeingredients << recipeingredient
  end
end
