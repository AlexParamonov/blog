require_relative '../../../spec_helper_lite'
require_relative "../../../../app/extentions/validation/adapters/active_model_adapter"

describe Extentions::Validation::ActiveModelAdapter do
  let(:model) { stub(:model) }
  subject { Extentions::Validation::ActiveModelAdapter.new(model) }

  it "should extract text error messages" do
    errors = stub(:errors, full_messages: ['first error', 'second error'])
    model.stub(errors: errors)

    subject.messages.should eq ['first error', 'second error']
  end

  it "should extract model name" do
    model.stub_chain(:class, :model_name, :human).and_return('Test Model')
    subject.model_name.should eq "Test Model"
  end
end
