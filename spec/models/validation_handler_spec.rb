require_relative "../spec_helper_lite"
require_relative "../support/stub_helper"
require_relative "../../app/models/validation_handler"

stub_class('ActiveModel::Errors')

describe ValidationHandler do
  let(:errors) do
    stub(:errors).tap do |error|
      error.stub(:is_a?).with(ActiveModel::Errors).and_return(true)
    end
  end

  it "should return the ActiveModelHandler if object uses ActiveModel::Errors" do
    ar_object = stub(:active_record_object, errors: errors)

    ValidationHandler.should_receive(:active_model).with(ar_object)
    ValidationHandler.for(ar_object)
  end

  # it "#for(object) should return an object that responds to errors" do
  #   handler.should respond_to :errors
  # end

  # describe "#errors" do
  #   let(:errors) { handler.errors }

  #   it "#messages should return all error messages" do
  #     errors.messages.should eq messages
  #   end

  #   it "#count should return number of errors" do
  #     errors.count.should eq 2
  #   end

  #   it "#any? should return true if object has errors" do
  #     errors.any?.should eq true
  #   end

  #   it "should return model name" do
  #     errors.model_name.should eq 'TestModel'
  #   end
  # end
end
