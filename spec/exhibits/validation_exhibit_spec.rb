require_relative "../spec_helper_lite"
require_relative "../../app/exhibits/validation_exhibit"

# exhibit or decorator
describe ValidationExhibit do
  let(:template) { stub(:template) }
  let(:object) { stub(:object) }
  let(:errors) { stub(:errors) }

  subject { ValidationExhibit.new(object, template) }

  before(:each) do
    subject.stub(:errors) { errors }
  end

  after(:each) do
    subject.render_errors
  end

  it "should not render any template if object has no errors" do
    errors.stub(:any?) { false }
    template.should_not_receive(:render)
  end

  it "should render error template if object has errors" do
    errors.stub(:any?) { true }
    # TODO investigate why array is returned
    template.should_receive(:render).and_return([])
    # template.should_receive(:render).with(partial: 'validation/errors', locals: {errors: duck_type(:messages, :model_name, :count)})
  end
end
