require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/lib/mapper"

describe Extentions::Tags::Mapper do
  subject { Extentions::Tags::Mapper.new(tag_source: tag_source, data_source: data_source) }
  let(:tag_source) { stub }
  let(:data_source) { stub }

  it "should create tags from data objects" do
    tag1 = stub(:tag1)
    tag2 = stub(:tag2)
    data_object1 = stub(:data_object1)
    data_object2 = stub(:data_object2)

    tag_source.should_receive(:call).once.ordered.with(data_object1).and_return(tag1)
    tag_source.should_receive(:call).once.ordered.with(data_object2).and_return(tag2)

    subject.from_data_objects([data_object1, data_object2]).should eq [tag1, tag2]
  end

  it "should create data_objects from tags" do
    tag1 = stub(:tag1)
    tag2 = stub(:tag2)
    data_object1 = stub(:data_object1)
    data_object2 = stub(:data_object2)

    data_source.should_receive(:call).once.ordered.with(tag1).and_return(data_object1)
    data_source.should_receive(:call).once.ordered.with(tag2).and_return(data_object2)

    subject.to_data_objects([tag1, tag2]).should eq [data_object1, data_object2]
  end
end
