require_relative "../spec_helper_lite"
require_relative "../../app/models/tag"

describe Tag do
  it "accept name argument" do
    name = 'ruby'
    tag = Tag.new(name: name)
    tag.name.should eq name
  end

  describe "#to_s" do
    it "should return tag name" do
      name = 'ruby'
      tag = Tag.new(name: name)
      tag.to_s.should eq name
    end
  end


  # it "should accept token agrument" do

  # end

end
