require_relative "../../../spec_helper"
require_relative "../../../support/post_background"
require_relative "../../../../app/extentions/tags/role"
require_relative "../../../../app/extentions/tags/controller"

describe "Tags role and controller" do
  let(:role) { Extentions::Tags::Role }
  let(:controller) { Extentions::Tags::Controller }

  let(:background) do
    PostBackground.new.tap do |post_background|
      post_background.action_framework = self
    end
  end

  before(:each) do
    @post = background.publish_post :js_post
  end

  it "should render tags" do
    template = stub
    tags = [{name: "ruby"}, {name: "rails"}]
    tag_objects = role.new(@post).find_and_assign_tags tags
    rendered = controller.new(@post, template).inline({ tags: tag_objects })

    rendered.should match /ruby.*rails/
  end

  specify "model should not have any tags by default" do
    role.new(@post).should have(0).tags
  end
end
