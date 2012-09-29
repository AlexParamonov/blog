class Post < ActiveRecord::Base
  attr_accessible :content, :summary, :title
  validates_presence_of :title
end
