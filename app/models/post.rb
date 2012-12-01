class Post < ActiveRecord::Base

  attr_accessible :content, :summary, :title, :pubdate
  validates_presence_of :title

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

  def self.first_before(date)
    where("pubdate < ?", date).order("pubdate DESC").first
  end

  def self.first_after(date)
    where("pubdate > ?", date).order("pubdate ASC").first
  end

  def prev
    self.class.first_before(pubdate)
  end

  def next
    self.class.first_after(pubdate)
  end

  def up
    feed
  end
end
