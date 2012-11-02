require_relative "../spec_helper_lite"
require_relative "../../app/models/tag_presenter"

describe TagPresenter do
  describe "#render inline" do
    it "renders tags as strings" do
      tag1 = Object.new
      tag2 = Object.new
      tag1.should_receive(:to_s).and_return('tag1')
      tag2.should_receive(:to_s).and_return('tag2')
      tagable = stub(:tagable, tags: [tag1, tag2])

      presenter = TagPresenter.new(tagable)
      presenter.render_inline.should match /tag1.*tag2/
    end
  end
end
