require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/controller"

describe Extentions::Tags::Controller do
  let(:template) { stub(:template) }
  let(:params) do { tags: tags } end
  let(:tags) { ['tag1', 'tag2'] }

  subject { Extentions::Tags::Controller.new(stub, template) }

  it "#nothing will render empty string" do
    template.should_not_receive(:render)
    subject.nothing.should eq ""
  end

  describe "#preview_block" do
    after(:each) do
      subject.preview_block(params)
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
      subject.input(params)
    end

    it "should render a template if object has no tags" do
      tags.stub(:any?) { false }
      template.should_receive(:render).and_return('empty input')
    end

    it "should render a template if object has tags" do
      tags.stub(:any?) { true }
      template.should_receive(:render).and_return('input with tags')
    end
  end

  describe "#from_input" do
    it "should split input tags" do
      test_string = "tag1,   other tag, and_another"
      params = { tags: test_string }
      subject.from_input(params).should eq ['tag1', 'other tag', 'and_another']
    end

    it "should find input string in params" do
      params.should_receive(:fetch).with(:tags).and_return("")
      subject.from_input(params)
    end

  end
end
