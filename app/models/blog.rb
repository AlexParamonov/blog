class Blog
  attr_accessor :post_source

  def new_post(*args)
    return post_source.(*args).tap do |post|
      post.blog = self
    end
  end

  def entries
    @entries || []
  end

  def add_entry(entry)
    @entries ||= []
    @entries << entry
  end
end
