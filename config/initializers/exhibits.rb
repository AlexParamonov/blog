DisplayCase.configure do |config|
  config.explicit = true
  config.exhibits = [DisplayCase::BasicExhibit, DisplayCase::EnumerableExhibit, ValidationExhibit, PathExhibit, PostExhibit, FeedExhibit]
end
