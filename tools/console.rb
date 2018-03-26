require_relative '../config/environment.rb'

wheat = Ingredient.new("Wheat")
cow = Ingredient.new("cow")
pepper = Ingredient.new("Pepper")

pasta = Recipe.new("Pasta", [wheat])

steak = Recipe.new("Steak",[pepper])

today = "2018,01,03"

max_rating = 9
deep_rating = 8

max = User.new("Max")
wheat_allergy = Allergy.new(user: max, name: "wheat",ingredient: wheat)

deep = User.new("Deep")

maxs_steak = RecipeCard.new(max, steak, today, max_rating)

max.recipecards = [maxs_steak]

max.add_recipe_card(steak, today, max_rating)
deep.add_recipe_card(steak, today, deep_rating)

deeps_pasta = RecipeCard.new(deep, pasta, today, deep_rating)
deep.add_recipe_card(pasta, today, deep_rating)
deep.recipecards = [deeps_pasta]

pasta_ri = RecipeIngredient.new(pasta, wheat)
cow_ri = RecipeIngredient.new(steak, cow)

Recipe.most_popular
pasta.allergens
binding.pry
" "
