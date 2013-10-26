class Mealplan < ActiveRecord::Base
  belongs_to :user
  attr_accessible :end, :start, :user_id
end
