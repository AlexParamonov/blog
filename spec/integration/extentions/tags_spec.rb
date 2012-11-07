require_relative "../../spec_helper"
require_relative "../../support/test_user"
require_relative "../../support/post_background"

describe "Tags extention" do
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

  let(:bob) { user.act_as 'Post::Visitor' }
  let(:alex) { user.act_as 'Post::Admin' }

  describe "no tags created" do
    describe "on post listing page" do
      before(:each) do
        @js  = background.publish_post :js_post
      end

      it "should not see any tags" do
        bob.visit_listing_page
        not_see '#tags'
      end
    end
  end

  describe "tags created" do
    describe "on post listing page" do
      before(:each) do
        alex.visit_new_page
        post = OpenStruct.new FactoryGirl.attributes_for(:js_post)

        fill_in post.title   => 'post_title',
                post.summary => 'post_summary',
                post.content => 'post_content',
                'ruby, js'   => 'tags'

        iclick "post.button.publish"
      end

      it "should see tags under #tags" do
        bob.visit_listing_page
        within '#tags' do
          see 'ruby'
          see 'js'
        end
      end
    end
  end
end
