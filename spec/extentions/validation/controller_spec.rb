require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/validation/controller"

describe Extentions::Validation::Controller do
  let(:template) { stub(:template) }
  let(:model) { stub(:model) }
  let(:params) do { messages: error_messages, model_name: 'Invalid model' } end
  let(:error_messages) { stub(:messages) }

  subject { Extentions::Validation::Controller.new(model, template) }

  after(:each) do
    subject.form(params)
  end

  it "should render nothing if no messages present" do
    error_messages.stub(:any?) { false }
    subject.should_receive(:nothing)
  end

  it "should render error template if error messages present" do
    error_messages.stub(:any?) { true }
    template.should_receive(:render).and_return('Errors')
    # template.should_receive(:render).with(partial: 'validation/errors', locals: {errors: duck_type(:messages, :model_name, :count)})
  end
end
