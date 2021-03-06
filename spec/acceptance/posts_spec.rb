require_relative "../spec_helper"
require_relative "../support/test_user"
require_relative "../support/post_background"

describe "Posts" do
  include I18nSupport
  include SpecHelpers
  include Rails.application.routes.url_helpers

  let(:user) { TestUser.new self }
  let(:background) { PostBackground.new self}

  describe "visitor on" do
    let!(:bob) { user.act_as 'Post::Visitor' }

    describe "post listing page" do
      before(:each) do
        @oor = background.publish_post :oor_post
        @js  = background.publish_post :js_post

        bob.visit_listing_page
      end

      it "should see all posts" do
        [@oor, @js].each do |post|
          see link: post.title
          see post.summary
        end
      end

      it "opens a post page for reading by clicking on a title" do
        click @oor.title

        see @oor.title
        see @oor.content

        not_see @js.title

        bob.should_be_at post_path(@oor)
      end
    end
  end
end
