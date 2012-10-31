require_relative "../spec_helper"
require_relative "../support/test_user"
require_relative "../support/post_background"

describe "Admin posts behavior:" do
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

  describe "admin on" do
    let!(:alex) { user.act_as :Admin }

    describe "post listing page" do
      before(:each) do
        @oor = background.publish_post :oor_post
        @js  = background.publish_post :js_post

        alex.visit_admin_posts_listing
      end

      it "should see all posts" do
        [@oor, @js].each do |post|
          see link: post.title
          see post.summary
        end
      end

      it "opens a post show page by clicking on a title" do
        click @oor.title

        see @oor.title
        see @oor.content

        not_see @js.title

        alex.should_be_at admin_post_path(@oor)
      end

      it "opens a post creation page" do
        iclick 'post.button.new'
        alex.should_be_at new_admin_post_path
      end
    end

    describe "post show page" do
      before(:each) do
        @oor = background.publish_post :oor_post

        alex.visit_admin_post_page_for(@oor)
      end

      it "opens an edit preview page" do
        click 'edit_post'
        alex.should_be_at edit_admin_post_path(@oor)
      end
    end

    describe "post creation page" do
      before(:each) do
        alex.visit_new_admin_post_page
      end

      it "opens a preview page"
      it "adds a new post" do
        fill_in "New post"     => 'post_title',
          "Post summary" => 'post_summary',
          "Post content" => 'post_content'

        iclick "post.button.publish"
        isee   "post.message.published"

        within('#entries') do
          see "New post"
          see "Post summary"
          see "Post content"
        end
      end
    end
  end
end
