class TagPresenter
  def initialize(model, context = nil)
    @tags = model.tags
  end

  def render_inline
    tags.join(', ')
  end

  private
  def tags
    @tags
  end
end

