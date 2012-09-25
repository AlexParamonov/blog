class Post < ActiveRecord::Base
  attr_accessible :content, :summary, :title
end
