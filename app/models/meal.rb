class Meal < ActiveRecord::Base
  belongs_to :mealplan
  attr_accessible :day, :breakfast, :lunch, :dinner
end
