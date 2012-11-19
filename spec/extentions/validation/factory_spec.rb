require_relative "../../spec_helper_lite"
require_relative "../../support/stub_helper"
require_relative "../../../app/extentions/validation/factory"

stub_class('ActiveModel::Errors')

describe Extentions::Validation::Factory do
  subject { Extentions::Validation::Factory.new }
  let(:model) { stub(:active_record_object, errors: errors) }
  let(:errors) do
    stub(:errors).tap do |error|
      error.stub(:is_a?).with(ActiveModel::Errors).and_return(true)
    end
  end

  it "should use the ActiveModelAdapter if object uses ActiveModel::Errors" do
    subject.role_for(model).should be_a Extentions::Validation::ActiveModelAdapter
  end
end

