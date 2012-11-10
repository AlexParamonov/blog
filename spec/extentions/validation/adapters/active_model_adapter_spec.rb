require 'active_model'
require_relative '../../../spec_helper_lite'
require_relative "../../../../app/extentions/validation/adapters/active_model_adapter"

class TestModel
  include ActiveModel::Validations
  attr_reader :id
  validates_presence_of :id
end

describe Extentions::Validation::ActiveModelAdapter do
  let(:model) { TestModel.new }
  subject { Extentions::Validation::ActiveModelAdapter.new(model) }

  before(:each) do
    model.valid?.should be_false
  end

  it "should extract text error messages" do
    subject.should have(1).messages
    subject.messages.at(0).should eq "Id can't be blank"
  end

  it "should extract model name" do
    subject.model_name.should eq "Test model"
  end
end
