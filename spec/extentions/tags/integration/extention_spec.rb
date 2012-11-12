require_relative "../../../spec_helper"
require_relative "../../../support/post_background"
require_relative "../../../../app/extentions/tags/role"
require_relative "../../../../app/extentions/tags/controller"
require_relative "../../../../app/extentions/tags/tag"

describe "Tags role and controller" do
  let(:role) { Extentions::Tags::Role }
  let(:controller) { Extentions::Tags::Controller }
  let(:tag) { Extentions::Tags::Tag }

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
    tags = [tag.new({name: "ruby"}), tag.new({name: "rails"})]

    role.new(@post).tags = tags
    rendered = controller.new(@post, template).inline({ tags: role.new(@post).tags })

    rendered.should match /ruby.*rails/
  end

  specify "model should not have any tags by default" do
    role.new(@post).should have(0).tags
  end
end
