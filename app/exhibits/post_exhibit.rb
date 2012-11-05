class PostExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object, context)
    object_is_any_of?(object, 'Post')
  end

  def render(*args)
    render_preview(*args)
  end

  def render_preview(template)
    template.render(partial: 'posts/preview', locals: {post: pointer})
  end

  def render_details(template)
    template.render(partial: 'posts/details', locals: {post: pointer})
  end
end
