require_relative "../spec_helper"
require_relative "../support/test_user"
require_relative "../support/post_background"

describe "Posts behavior:" do
  include I18nSupport
  include SpecHelpers

  let(:user) do
    TestUser.new.tap do |user|
      user.action_framework = self
    end
  end

  let(:background) do
    PostBackground.new.tap do |post_background|
      post_background.action_framework = self
    end
  end

  describe "visitor on" do
    let!(:bob) { user.act_as :Visitor }

    describe "post listing page" do
      before(:each) do
        @oor         = background.publish_post :oor_post
        @js          = background.publish_post :js_post

        bob.visit_posts_listing
      end

      it "should see all posts" do
        [@oor, @js].each do |post|
          see link: post.title
          see post.summary
        end
      end

      it "open a post page for reading by clicking on a title" do
        click @oor.title

        see @oor.title
        see @oor.content

        not_see @js.title

        bob.should_be_at post_path(@oor)
      end
    end
  end

  describe "admin area" do
    describe "admin on" do
      let!(:alex) { user.act_as :Admin }

      describe "post listing page" do
        before(:each) do
          @oor         = background.publish_post :oor_post
          @js          = background.publish_post :js_post

          alex.visit_admin_posts_listing
        end

        it "should see all posts" do
          [@oor, @js].each do |post|
            see link: post.title
            see post.summary
          end
        end

        it "open a post preview by clicking on a title" do
          click @oor.title

          see @oor.title
          see @oor.content

          not_see @js.title

          alex.should_be_at admin_post_path(@oor)
        end

        it "open a post creation page" do
          iclick 'post.button.new'
          alex.should_be_at new_admin_post_path
        end
      end

    end
  end
end
