class Feed
  attr_writer :post_source, :entry_fetcher

  def initialize(options = {})
    self.entry_fetcher = options.fetch(:entry_fetcher, ->{ Post.scoped })
    self.post_source   = options.fetch(:post_source, ->(*args){ Post.new(*args) })
  end

  def title
    "Feed"
  end

  def subtitle
    "Ideas, events, solutions"
  end

  def new_post(*args)
    return post_source.call(*args).tap do |post|
      post.feed = self
    end
  end

  def post(id)
    entries.find(id)
  end

  def entries
    fetch_entries
  end

  def add_entry(entry)
    entry.save!
  end

  private
  attr_reader :post_source, :entry_fetcher

  def fetch_entries
    entry_fetcher.call()
  end
end
