require_relative "../spec_helper_lite"
require_relative "../../app/models/feed"

require "ostruct"
describe Feed do
  let(:feed)    { Feed.new }

  specify { feed.entries.should be_empty }

  describe "#new_post" do
    before(:each) do
      @new_post = OpenStruct.new
      feed.post_source = -> { @new_post }
    end

    it "returns new post" do
      feed.new_post.should eq @new_post
    end

    it "sets the post's feed reference to itself" do
      feed.new_post.feed.should eq feed
    end

    it "accepts an attribute hash and delegates it to a source" do
      # prepare a source
      post_source = mock(:post_source)
      post_source.should_receive(:call).with(x:1, y:2).and_return(stub.as_null_object)
      feed.post_source = post_source

      feed.new_post(x:1, y:2)
    end
  end

  describe "#add_entry" do
    let(:entry) { stub.as_null_object }

    it "adds the entry to the feed" do
      feed.add_entry(entry)
      feed.entries.should include entry
    end
  end

  describe "#entries" do
    let(:feed)    { Feed.new }

    it "should return entries from a fetcher" do
      entries_fetcher = ->{ [:one, :two] }
      feed = Feed.new(entry_fetcher: entries_fetcher)

      feed.entries.should eq  [:one, :two]
    end
  end
end
