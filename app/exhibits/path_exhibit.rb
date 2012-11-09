require 'display_case'
require 'naming'

class PathExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object, context)
    object_is_any_of?(object, 'Post')
  end

  def path
    context.polymorphic_path namespace_tokens << __getobj__
  end

  def namespace_path(path)
    (namespace_tokens << path).join('/')
  end

  private
  def namespace_tokens
    Naming.new(context).tokens
  end
end
