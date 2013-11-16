class Diary < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :user_id
  has_many :entries
end
