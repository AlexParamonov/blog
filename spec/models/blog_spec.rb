require_relative "../spec_helper_lite"
require_relative "../../app/models/blog"

require "ostruct"
describe Blog do
  let(:blog)    { Blog.new }
  let(:entry) { stub.as_null_object }

  specify { blog.entries.should be_empty }

  describe "#new_post" do
    before(:each) do
      @new_post = OpenStruct.new
      blog.post_source = -> { @new_post }
    end

    it "returns new post" do
      blog.new_post.should eq @new_post
    end

    it "sets the post's blog reference to itself" do
      blog.new_post.blog.should eq blog
    end

    it "accepts an attribute hash and delegates it to a source" do
      # prepare a source
      post_source = mock(:post_source)
      post_source.should_receive(:call).with(x:1, y:2).and_return(entry)
      blog.post_source = post_source

      blog.new_post(x:1, y:2)
    end
  end

  describe "#add_entry" do
    it "adds the entry to the blog" do
      blog.add_entry(entry)
      blog.entries.should include entry
    end
  end
end
