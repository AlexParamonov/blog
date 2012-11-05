require_relative "../../../spec_helper"
require_relative "../../../support/post_background"
require_relative "../../../../app/extentions/tags/role"
require_relative "../../../../app/extentions/tags/presenter"

describe "Tags role and presenter" do
  let(:role) { Extentions::Tags::Role }
  let(:presenter) { Extentions::Tags::Presenter }

  let(:background) do
    PostBackground.new.tap do |post_background|
      post_background.action_framework = self
    end
  end

  before(:each) do
    @post = background.publish_post :js_post
  end

  after(:each) do
    role.reset_cache
  end

  it "should render tags" do
    template = stub
    @tags = %w(ruby rails)
    role.new(@post).tags = @tags
    role.reset_cache
    rendered = presenter.new(role.new(@post), template).inline

    rendered.should match /ruby.*rails/
  end

  specify "model should not have any tags by default" do
    role.new(@post).should have(0).tags
  end
end
