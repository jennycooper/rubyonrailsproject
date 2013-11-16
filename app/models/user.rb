class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_one :mealplan, dependent: :destroy
  has_one :diary, dependent: :destroy

  after_create :create_meal_plan

  def create_meal_plan 
   Diary.create(user_id: self.id)
   Mealplan.create(user_id: self.id)
   #Diary.create(user_id: self.id)
  end

end
