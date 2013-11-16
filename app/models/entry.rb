class Entry < ActiveRecord::Base
  belongs_to :diary
  attr_accessible :comment, :day
end
