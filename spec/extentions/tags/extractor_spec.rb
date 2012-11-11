require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/extractor"

describe Extentions::Tags::Extractor do
  let(:template) { stub(:template) }
  let(:object) { stub(:object, tags: tags) }

  subject { Extentions::Tags::Extractor.new }
    it "should create tags from text string" do
      test_string = "tag1,   other tag, and_another"
      tags = subject.from_string(test_string)

      tags.should eq ['tag1', 'other tag', 'and_another']
    end
end
