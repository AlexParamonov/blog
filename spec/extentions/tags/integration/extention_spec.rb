require_relative "../../../spec_helper"
require_relative "../../../support/post_background"
require_relative "../../../../app/extentions/tags/controller"
require_relative "../../../../app/extentions/tags/models/tag"

describe "controller" do
  let(:extention)  { Extentions::Tags }
  let(:template)   { Extentions::Renderer.new(stub(:extention, to_token: 'tags')) }
  let(:controller) { extention::Controller }
  let(:tag)        { extention::Model::Tag }

  let(:background) { PostBackground.new self}

  before(:each) do
    @post = background.publish_post :js_post
  end

  it "should render tags" do
    tags = [tag.new({name: "ruby"}), tag.new({name: "rails"})]

    rendered = controller.new(@post, template).preview_block({ tags: tags })

    rendered.should match /ruby.*rails/
  end
end
