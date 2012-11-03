require 'display_case'
require_relative '../models/tag_presenter'

class TagsExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object, context)
    object_is_any_of?(object, 'Post')
  end

  def render_tags(template)
    presenter.send render_action, template
  end

  private
  def render_action
    case context.action_name.to_sym
      when :show, :index then :render_preview_block
      when :create, :update, :edit, :new then :render_input
      else :render_nothing
    end
  end

  def presenter
    TagPresenter.new(Tagable.new(self), context)
  end
end
