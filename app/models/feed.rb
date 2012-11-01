class Feed
  attr_writer :post_source, :entry_fetcher

  def initialize(options = {})
    self.entry_fetcher = options.fetch(:entry_fetcher, ->{ @entries })
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

  # Fetch a post by ID
  def post(id)
    Post.find_by_id(id)
  end

  def entries
    fetch_entries || []
  end

  def add_entry(entry)
    @entries ||= []
    @entries << entry
  end

  private
  def fetch_entries
    entry_fetcher.call()
  end

  def post_source
    @post_source
  end

  def entry_fetcher
    @entry_fetcher
  end
end
