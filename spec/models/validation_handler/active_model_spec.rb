require 'active_model'
require_relative '../../spec_helper_lite'
require_relative "../../../app/models/validation_handler/active_model_extractor"

class TestModel
  include ActiveModel::Validations
  attr_reader :id
  validates_presence_of :id
end

describe ValidationHandler::ActiveModelExtractor do
  let(:model) { TestModel.new }
  let(:extractor) { ValidationHandler::ActiveModelExtractor.new(model) }

  before(:each) do
    model.valid?.should be_false
  end

  it "should extract text error messages" do
    extractor.should have(1).messages

    # todo use translation
    extractor.messages.at(0).should eq "Id can't be blank"
  end

  it "should extract model name" do
    extractor.model_name.should eq "Test model"
  end
end
