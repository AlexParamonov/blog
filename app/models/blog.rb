class Blog
  attr_accessor :post_source, :entry_fetcher

  def initialize(entry_fetcher = ->{ @entries })
    self.entry_fetcher = entry_fetcher
  end

  def new_post(*args)
    return post_source.(*args).tap do |post|
      post.blog = self
    end
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
end
