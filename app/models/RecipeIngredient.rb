class RecipeIngredient
  attr_accessor :ingredient, :recipe

  @@all = []

  def initialize(recipe, ingredient)
    @ingredient = ingredient
    @recipe = recipe
    @recipe.add_ingredients(ingredient)
    @@all << self
  end

  def self.all
    @@all
  end

end
