class TagPresenter
  def initialize(model, context = nil)
    @tags = model.tags
  end

  def render_inline(template = nil)
    tags.join(', ')
  end

  def render_preview_block(template)
     template.render('modules/tags/preview_block', inline_tags: render_inline).html_safe
  end

  def render_input(template)
     template.render('modules/tags/input', inline_tags: render_inline).html_safe
  end

  def render_nothing
    ""
  end

  private
  attr_reader :tags
end

