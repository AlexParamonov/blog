require_relative "../../spec_helper_lite"
require_relative "../../support/stub_helper"
require_relative "../../../app/extentions/validation/role"

stub_class('ActiveModel::Errors')

describe Extentions::Validation::Role do
  subject { Extentions::Validation::Role }
  let(:instance) { subject.new(model) }
  let(:model) { stub }

  it "should be initialized with a model" do
    instance.send(:model).should eq model
  end

  describe "error handling" do
    let(:model) { stub(:active_record_object, errors: errors) }
    let(:errors) do
      stub(:errors).tap do |error|
        error.stub(:is_a?).with(ActiveModel::Errors).and_return(true)
      end
    end

    it "should return model errors by #errors method" do
      errors.stub(:full_messages).and_return(['first error', 'second error'])
      model.stub_chain(:class, :model_name, :human).and_return('Test Model')

      instance.errors.messages.should eq ['first error', 'second error']
    end

    it "should use the ActiveModelAdapter if object uses ActiveModel::Errors" do
      instance.should_receive(:active_model).and_return(stub(:errors, errors:[]))
      instance.errors
    end
  end
end

