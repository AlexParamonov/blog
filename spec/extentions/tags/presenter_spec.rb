require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/presenter"

describe Extentions::Tags::Presenter do
  let(:template) { stub(:template) }
  let(:object) { stub(:object, tags: tags) }
  let(:tags) { stub(:tags) }

  subject { Extentions::Tags::Presenter.new(object, template) }

  it "#nothing will render empty string" do
    template.should_not_receive(:render)
    subject.nothing.should eq ""
  end

  describe "#preview_block" do
    after(:each) do
      subject.preview_block
    end

    it "should not render any template if object has no tags" do
      tags.stub(:any?) { false }
      subject.should_receive(:nothing)
    end

    it "should render a template if object has tags" do
      tags.stub(:any?) { true }
      subject.stub(:inline)
      template.should_receive(:render).and_return('tags')
    end
  end

  describe "#input" do
    after(:each) do
      subject.input
    end

    it "should not render any template if object has no tags" do
      tags.stub(:any?) { false }
      subject.should_receive(:nothing)
    end

    it "should render a template if object has tags" do
      tags.stub(:any?) { true }
      subject.stub(:inline)
      template.should_receive(:render).and_return('tags')
    end
  end

  describe "#inline" do
    let(:tags) { %w(tag1 tag2) }

    it "should render tags as strings" do
      subject.inline.should match /tag1.*tag2/
    end
  end
end
