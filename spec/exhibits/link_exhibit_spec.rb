require_relative '../spec_helper_lite'
require_relative '../../app/exhibits/link_exhibit'
require 'json'

describe LinkExhibit do
  subject { LinkExhibit.new(model, context) }
  let(:model) { OpenStruct.new(:next => next_object, prev: prev, up: up) }
  let(:context) { Object.new }
  let(:next_object) { Object.new }
  let(:up) { Object.new }
  let(:prev) { Object.new }

  before(:each) do
    model.stub(:serializable_hash).and_return({model_data: "MODEL_DATA"})
    context.stub(:url_for).with(next_object).and_return("URL_FOR_NEXT")
    context.stub(:url_for).with(prev).and_return("URL_FOR_PREV")
    context.stub(:url_for).with(up).and_return("URL_FOR_UP")
  end

  it "constructs URLs for prev, next, and up" do
    subject.prev_url.should eq "URL_FOR_PREV"
    subject.next_url.should eq "URL_FOR_NEXT"
    subject.up_url.should eq "URL_FOR_UP"
  end

  describe "#serializable_hash" do
    it "adds next, prev, and up URLs" do
      subject.serializable_hash["links"].should include({"rel" => "up", "href" => "URL_FOR_UP"})
      subject.serializable_hash["links"].should include({"rel" => "next", "href" => "URL_FOR_NEXT"})
      subject.serializable_hash["links"].should include({"rel" => "prev", "href" => "URL_FOR_PREV"})
    end

    it "includes data from the model" do
      subject.serializable_hash[:model_data].should eq "MODEL_DATA"
    end

    it "passes arguments to the model" do
      model.should_receive(:serializable_hash).with({:foo => "bar"}).and_return({})
      subject.serializable_hash({:foo => "bar"})
    end
  end

  describe "#to_json" do
    it "spits out the JSON version of the serializable hash" do
      subject.to_json.should eq subject.serializable_hash.to_json
    end
  end
end
