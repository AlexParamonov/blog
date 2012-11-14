require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/mapper"

describe Extentions::Tags::Mapper do
  subject { Extentions::Tags::Mapper.new(tag_source: tag_source, data_source: data_source) }
  let(:tag_source) { stub }
  let(:data_source) { stub }

  it "should create tags from data objects" do
    tag1       = stub(:tag1)
    tag2       = stub(:tag2)
    data_objects = [stub(:data_object1, attributes: { name: 'tag1' }), stub(:data_object2, attributes: { name: 'tag2' })]

    tag_source.should_receive(:call).once.ordered.with({name: 'tag1'}).and_return(tag1)
    tag_source.should_receive(:call).once.ordered.with({name: 'tag2'}).and_return(tag2)

    subject.from_data_objects(data_objects).should eq [tag1, tag2]
  end

  it "should create data_objects from tags" do
    data_object1 = stub(:data_object1)
    data_object2 = stub(:data_object2)

    tags = [stub(:tag1, name: 'tag1'), stub(:tag2, name: 'tag2')]

    data_source.should_receive(:call).once.ordered.with({name: 'tag1'}).and_return(data_object1)
    data_source.should_receive(:call).once.ordered.with({name: 'tag2'}).and_return(data_object2)

    subject.to_data_objects(tags).should eq [data_object1, data_object2]
  end
end
