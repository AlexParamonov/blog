require_relative "../../spec_helper_lite"

describe "Extentions::Tags::Role" do
  let(:model) { stub(:model) }
  let(:role) { Extentions::Tags::Role }
  subject { role.new(model) }

  before(:each) do
    require_relative '../../support/hide_ar'
    require_relative '../../../app/extentions/tags/role'
    role::TagRelations.stub(:assign).as_null_object

    role.reset_cache
    model.stub(:id).and_return(1)
    model.stub_chain(:class, :name).and_return('SomeModel')
  end

  it "should store tags and return them back" do
    tags = %w(foo bar)

    subject.tags = tags

    fetched_tagable = role.new(model)
    fetched_tagable.tags.should eq tags
  end

  it "should fetch tags if no tags cached" do
    subject.stub(:fetch_tags).and_return(['fetched'])
    subject.tags.should eq ['fetched']
  end
end
