require_relative "../../spec_helper_lite"
require_relative "../../support/stub_helper"
require_relative "../../../app/extentions/tags/role"

stub_class('ActiveRecord::Relation')

describe Extentions::Tags::Role do
  subject { Extentions::Tags::Role }

  it "should use the Record if got an object" do
    model = Object.new
    subject.for(model).should be_a Extentions::Tags::Role::Record
  end

  it "should use the Relation if got a class" do
    model = Class.new
    subject.for(model).should be_a Extentions::Tags::Role::Relation
  end
end

