require_relative "../spec_helper_lite"
require_relative "../../lib/naming"

describe Naming do
  let(:object) { stub(:object) }

  describe "#module_name" do
    it "should return module name for an object" do
      object.stub_chain(:class, :name).and_return('Admin::Test::Module::Object')
      Naming.new(object).module_name.should eq 'Admin::Test::Module'
    end

    it "should return empty module name if object has no namespace" do
      object.stub_chain(:class, :name).and_return('Object')
      Naming.new(object).module_name.should eq ''
    end
  end

  describe "#tokens" do
    it "should return object modules as downcase and as symbols" do
      object.stub_chain(:class, :name).and_return('Admin::Test::Module::Object')
      Naming.new(object).tokens.should eq [:admin, :test, :module]
    end
  end
end
