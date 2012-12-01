require_relative '../spec_helper_nulldb'
require_relative "../../app/models/post"

describe Post do
  include NullDB::RSpec::NullifiedDatabase
  subject { Post.new(title: "new post") }

  describe "#pubdate" do
    describe "before publishing" do
      it "is blank" do
        subject.pubdate.should be_nil
      end
    end

    describe "after publishing" do
      before(:each) do
        @now = DateTime.parse("2011-09-11T02:56")
        @clock = stub(:clock, now: @now)
        subject.feed = stub.as_null_object
        subject.publish(@clock)
      end

      it "is a datetime" do
        %w(DateTime ActiveSupport::TimeWithZone).should include subject.pubdate.class.to_s
      end

      it "is the current time" do
        subject.pubdate.should eq @now
      end
    end
  end
end
