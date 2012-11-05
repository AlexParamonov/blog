require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/validation/role"

describe Extentions::Validation::ModelErrors do
  let(:model_name) { 'TestModel' }
  let(:messages) { ['first error', 'second error'] }

  subject { Extentions::Validation::ModelErrors.new(model_name: model_name, messages: messages) }

  it "#messages should return all error messages" do
    subject.messages.should eq messages
  end

  it "#count should return number of errors" do
    subject.count.should eq 2
  end

  it "#any? should return true if object has errors" do
    subject.any?.should eq true
  end

  it "#model_name should return model name" do
    subject.model_name.should eq 'TestModel'
  end
end
