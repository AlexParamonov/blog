require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/tag"

describe Extentions::Tags::Tag do
  subject { Extentions::Tags::Tag }

  it "accept name argument" do
    name = 'ruby'
    tag = subject.new(name: name)
    tag.name.should eq name
  end

  describe "#to_s" do
    it "should return tag name" do
      name = 'ruby'
      tag = subject.new(name: name)
      tag.to_s.should eq name
    end
  end

  # it "should accept token agrument"
end
