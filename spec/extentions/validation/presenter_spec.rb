require_relative "../../spec_helper_lite"
require_relative "../../../app/extentions/validation/presenter"

describe Extentions::Validation::Presenter do
  let(:template) { stub(:template) }
  let(:object) { stub(:object, errors: errors) }
  let(:errors) { stub(:errors) }

  subject { Extentions::Validation::Presenter.new(object, template) }

  after(:each) do
    subject.form
  end

  it "should not render any template if object has no errors" do
    errors.stub(:any?) { false }
    template.should_not_receive(:render)
  end

  it "should render error template if object has errors" do
    errors.stub(:any?) { true }
    template.should_receive(:render).and_return('Errors')
    # template.should_receive(:render).with(partial: 'validation/errors', locals: {errors: duck_type(:messages, :model_name, :count)})
  end
end
