require_relative "../spec_helper_lite"
require_relative "../../app/exhibits/path_exhibit"

describe PathExhibit do
  let(:model) { stub(:model) }
  let(:context) { stub(:context) }

  it "should return a path for a context" do
    context.stub_chain(:class, :name).and_return('Admin::Test::Model')
    context.should_receive(:polymorphic_path).with([:admin, :test, model]).and_return("admin/test/1")
    exhibit = PathExhibit.new(model, context)
    exhibit.path.should eq "admin/test/1"
  end
end
