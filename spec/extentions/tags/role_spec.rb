require_relative "../../spec_helper_lite"
require_relative "../../support/stub_helper"
require_relative "../../../app/extentions/tags/role"

stub_class('ActiveRecord::Relation')

describe Extentions::Tags::Role do
  subject { Extentions::Tags::Role }

  it "should use the TaggableRecord if got an object" do
    model = Object.new
    subject.for(model).should be_a Extentions::Tags::TaggableRecord
  end

  it "should use the TaggableRelation if got a class" do
    model = Class.new
    subject.for(model).should be_a Extentions::Tags::TaggableRelation
  end
end

