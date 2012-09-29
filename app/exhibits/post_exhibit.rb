class PostExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object)
    object_is_any_of?(object, 'Post')
  end

  def render(*args)
    render_preview(*args)
  end

  def render_preview(template)
    template.render(partial: 'posts/preview', locals: {post: self})
  end

  def render_details(template)
    template.render(partial: 'posts/details', locals: {post: self})
  end
end
