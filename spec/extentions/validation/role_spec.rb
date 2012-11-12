require_relative "../../spec_helper_lite"
require_relative "../../support/stub_helper"
require_relative "../../../app/extentions/validation/role"

stub_class('ActiveModel::Errors')

describe Extentions::Validation::Role do
  subject { Extentions::Validation::Role }
  let(:model) { stub(:active_record_object, errors: errors) }
  let(:errors) do
    stub(:errors).tap do |error|
      error.stub(:is_a?).with(ActiveModel::Errors).and_return(true)
    end
  end

  it "should use the ActiveModelAdapter if object uses ActiveModel::Errors" do
    subject.for(model).should be_a Extentions::Validation::ActiveModelAdapter
  end
end

