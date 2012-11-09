class Post < ActiveRecord::Base
  attr_accessor :feed

  attr_accessible :content, :summary, :title
  validates_presence_of :title

  def publish
    save
  end

  def publish!
    save!
  end
end
