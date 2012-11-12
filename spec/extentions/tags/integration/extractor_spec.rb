require_relative "../../../spec_helper_lite"
require_relative "../../../../app/extentions/tags/extractor"
require_relative "../../../../app/extentions/tags/tag"

describe "Tags extractor" do
  let(:extractor) { Extentions::Tags::Extractor }
  let(:tag) { Extentions::Tags::Tag }

  it "should create a new tags" do
    test_string = "tag1,   other tag, and_another"

    tags = extractor.new.from_string(test_string)

    tags.first.should be_a tag
    tags.map(&:name).should eq ['tag1', 'other tag', 'and_another']
  end
end
