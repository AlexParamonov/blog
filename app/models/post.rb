class Post < ActiveRecord::Base
  LIMIT_DEFAULT = 10

  attr_accessible :content, :summary, :title, :pubdate
  validates_presence_of :title, :pubdate

  def self.ordered(limit = LIMIT_DEFAULT, clock = DateTime)
    before(clock.now).limit(limit)
  end

  def self.before(date)
    where("pubdate < ?", date).order("pubdate DESC")
  end

  def self.after(date)
    where("pubdate > ?", date).order("pubdate ASC")
  end


  attr_writer :feed
  def feed
    @feed ||= THE_FEED
  end

  def publish(clock = DateTime)
    publish!(clock)
  rescue
    false
  end

  def publish!(clock = DateTime)
    self.pubdate ||= clock.now
    feed.add_entry(self)
  end

  def prev
    self.class.before(pubdate).first
  end

  def next
    self.class.after(pubdate).first
  end

  def up
    feed
  end
end
