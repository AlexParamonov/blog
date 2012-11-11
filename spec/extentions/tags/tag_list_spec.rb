require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/tag_list"

describe Extentions::Tags::TagList do
  subject { Extentions::Tags::TagList }

  describe "given empty array" do
    let(:tag_list) { subject.new([]) }

    it "is empty" do
      tag_list.should be_empty
    end
  end

  describe "given duplicate mixed case tags" do
    let(:tag_list) { subject.new(%w(ruby rAilS foo rUbY)) }

    it "eliminates duplicates and lowercase tags" do
      tag_list.to_a.should eq %w(ruby rails foo)
    end
  end

  describe "#sort" do
    let(:tag_list) { subject.new(%w(foo bar baz fuz)) }

    it "returns the sorted rags" do
      tag_list.sort.to_a.should eq %w(bar baz foo fuz)
    end

    it "returns another tag list" do
      result = tag_list.sort
      result.should be_a subject
    end

  end
end
