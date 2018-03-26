class Allergy
  attr_accessor :user, :name, :ingredient

  @@all = []

  def initialize(user:, name:, ingredient:)
    @user = user
    @name = name
    @ingredient = ingredient
    ingredient.add_allergens(self)
  end

  def self.all
    @@all
  end
end
