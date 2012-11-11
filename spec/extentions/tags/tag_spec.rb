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
    it "should return tag comparation attribute" do
      name = 'ruby'
      subject.stub(:comparation_attribute).and_return{ name }
      tag = new_tag name
      tag.to_s.should eq name
    end
  end

  it "should act as string" do
    tag = new_tag 'ruby'

    (tag == 'ruby').should be_true
    (tag.eql? 'ruby').should be_true
    (tag <=> 'ruby').should eq 0
  end

  it "should downcase itself" do
    tag = new_tag 'rUby'
    tag.downcase!
    tag.name.should eq 'ruby'
  end

  it "should compare itself to another tag object" do
    ruby1 = new_tag 'ruby'
    ruby2 = new_tag 'ruby'
    rails = new_tag 'rails'

    (ruby1 == ruby2).should be_true
    (ruby1 == rails).should be_false
  end

  private
  def new_tag(name)
    subject.new name: name
  end

  # it "should accept token agrument"
end
