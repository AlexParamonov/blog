require_relative "../spec_helper"

describe Post do
  include SpecHelpers
  let(:feed) { THE_FEED }

  it "supports navigation methods" do
    p2 = make_post_with_date("2011-11-11")
    p1 = make_post_with_date("2011-11-10")
    p3 = make_post_with_date("2011-11-12")

    p1.prev.should be_nil
    p2.prev.should eq p1
    p3.prev.should eq p2

    p1.next.should eq p2
    p2.next.should eq p3
    p3.next.should be_nil

    p1.up.should eq feed
    p2.up.should eq feed
    p3.up.should eq feed
  end

  private
  def make_post(attrs)
    attrs[:title] ||= "Post #{attrs.hash}"
    post = feed.new_post(attrs)
    post.publish.should eq true
    post
  end

  def make_post_with_date(date)
    make_post(:pubdate => DateTime.parse(date),
              :title => date)
  end

end

