class PathExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object)
    object_is_any_of?(object, 'Post')
  end

  def path
    module_name = context.module_name
    if module_name
      context.polymorphic_path([module_name.downcase, __getobj__])
    else
      context.polymorphic_path(__getobj__)
    end
  end
end
