require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/tags/factory"

describe Extentions::Tags::Factory do
  subject { Extentions::Tags::Factory.new(adapters) }
  let(:relation) { stub(:relation) }
  let(:record) { stub(:record) }
  let(:adapters) { stub(:adapters, record: ->(model){ record }, relation: ->(model){ relation }) }


  describe "#role_for model" do
    it "returns a record adapter if got an object" do
      model = Object.new
      subject.role_for(model).should eq record
    end

    it "returns a relation adapter if got a class" do
      model = Class.new
      subject.role_for(model).should eq relation
    end
  end
end

