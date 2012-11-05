class PostExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object, context)
    object_is_any_of?(object, 'Post')
  end

  def render(*args)
    render_preview(*args)
  end

  def render_preview(template)
    # TODO autoapply
    load_modules
    template.render(partial: 'posts/preview', locals: {post: pointer})
  end

  def render_details(template)
    load_modules
    template.render(partial: 'posts/details', locals: {post: pointer})
  end

  def render_form(template)
    load_modules
    template.render(partial: 'posts/form', locals: {post: pointer})
  end

  def load_modules
    self.pointer = Extentions.extentions_for(pointer, context).build_presenter
  end
end
