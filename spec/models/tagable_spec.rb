require_relative "../spec_helper_lite"
# require 'facets'

describe "Tagable" do
  let(:model) { stub(:model) }

  before(:each) do
    # load_relative '../support/hide_ar.rb'
    require File.join(File.dirname(__FILE__), '../support/hide_ar')
    require_relative "../../app/models/tagable"
    Tagable::TagRelations.stub(:assign).as_null_object

    Tagable.reset_cache
    model.stub(:id).and_return(1)
    model.stub_chain(:class, :name).and_return('SomeModel')
  end

  it "should store tags and return them back" do
    tags = %w(foo bar)

    tagable = Tagable.new(model)
    tagable.tags = tags

    fetched_tagable = Tagable.new(model)
    fetched_tagable.tags.should eq tags
  end

  it "should fetch tags if no tags cached" do
    tagable = Tagable.new(model)
    tagable.stub(:fetch_tags).and_return(['fetched'])
    tagable.tags.should eq ['fetched']
  end

end
