require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/extractor"

describe Extentions::Tags::Extractor do
  let(:template) { stub(:template) }
  let(:object) { stub(:object, tags: tags) }
  let(:extractor) { Extentions::Tags::Extractor }
  subject { extractor.new }

  it "should create tags from text string" do
    test_string = "tag1,   other tag, and_another"

    subject.should_receive(:new_tag).once.ordered.with({name: 'tag1'}).and_return('tag1')
    subject.should_receive(:new_tag).once.ordered.with({name: 'other tag'}).and_return('other tag')
    subject.should_receive(:new_tag).once.ordered.with({name: 'and_another'}).and_return('and_another')

    subject.from_string(test_string).should eq ['tag1', 'other tag', 'and_another']
  end

  it "should create tags from data objects" do
    tag_source = stub(:tag_source)
    tag1       = stub(:tag1)
    tag2       = stub(:tag2)

    data_objects = [stub(:data_object1, attributes: { name: 'tag1' }), stub(:data_object2, attributes: { name: 'tag2' })]

    tag_source.should_receive(:call).once.ordered.with({name: 'tag1'}).and_return(tag1)
    tag_source.should_receive(:call).once.ordered.with({name: 'tag2'}).and_return(tag2)

    tags = extractor.new(tag_source: tag_source).from_data_objects(data_objects)
    tags.should eq [tag1, tag2]
  end

  it "should create data_objects from tags" do
    data_source  = stub(:data_source)
    data_object1 = stub(:data_object1)
    data_object2 = stub(:data_object2)

    tags = [stub(:tag1, name: 'tag1'), stub(:tag2, name: 'tag2')]

    data_source.should_receive(:call).once.ordered.with({name: 'tag1'}).and_return(data_object1)
    data_source.should_receive(:call).once.ordered.with({name: 'tag2'}).and_return(data_object2)

    data_objects = extractor.new(data_source: data_source).to_data_objects(tags)
    data_objects.should eq [data_object1, data_object2]
  end
end
