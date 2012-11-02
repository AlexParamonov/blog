require_relative "../spec_helper"
require_relative "../support/post_background"
require_relative "../../app/models/tagable"
require_relative "../../app/models/tag_presenter"

describe "Tags module" do
  let(:background) do
    PostBackground.new.tap do |post_background|
      post_background.action_framework = self
    end
  end

  before(:each) do
    @post = background.publish_post :js_post
    @tags = %w(ruby rails)
    Tagable.new(@post).tags = @tags
    Tagable.reset_cache
  end

  it "should render tags" do
    rendered = TagPresenter.new(Tagable.new(@post)).render_inline

    rendered.should match /ruby.*rails/
  end
end
