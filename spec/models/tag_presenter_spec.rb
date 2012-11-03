require_relative "../spec_helper_lite"
require_relative "../../app/models/tag_presenter"

describe TagPresenter do
  let(:tag2) { Object.new }
  let(:tag1) { Object.new }

  before(:each) do
    tag1.stub(:to_s).and_return('tag1')
    tag2.stub(:to_s).and_return('tag2')
  end

  describe "#render inline" do
    it "renders tags as strings" do
      tagable = stub(:tagable, tags: [tag1, tag2])

      presenter = TagPresenter.new(tagable)
      presenter.render_inline.should match /tag1.*tag2/
    end
  end

  describe "#render input" do
    it "should render input form field" do
      pending 'how to test view?'
      tagable = stub(:tagable, tags: [tag1, tag2])
      presenter = TagPresenter.new(tagable)
      render = presenter.render_input
      result.should match /<input .*/
    end
  end
end
