require 'display_case'

class FeedExhibit < DisplayCase::Exhibit
  def self.applicable_to?(object, context)
    object_is_any_of?(object, 'Feed')
  end

  exhibit_query :entries
end

