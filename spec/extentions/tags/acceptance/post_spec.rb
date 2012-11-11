require_relative "../../../spec_helper"
require_relative "../../../support/test_user"
require_relative "../../../support/post_background"

describe "Tags extention" do
  include I18nSupport
  include SpecHelpers
  include Rails.application.routes.url_helpers

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
    before(:each) do
      @js  = background.publish_post :js_post
    end

    describe "on post listing page" do

      it "should not see any tags" do
        bob.visit_listing_page
        not_see '#tags'
      end
    end

    describe "on post creation page" do
      before(:each) do
        alex.visit_new_page
      end

      it "should skip duplicated tags" do
        alex.visit_edit_page(@js)

        fill_in 'ruby, ruby, rails' => 'tags'

        iclick "post.button.publish"
        isee   "post.message.updated"

        see 'ruby'
        see 'rails'
        not_see 'ruby, ruby'
      end
    end
  end

  describe "tags created" do
    before(:each) do
      @oor = background.publish_post :oor_post
      alex.visit_edit_page(@oor)
      fill_in 'ruby, js' => 'tags'
      iclick "post.button.publish"
    end

    describe "on post edit page" do
      pending "should fill in tags with currentry assigned tags" do
        alex.visit_edit_page(@oor)
        see 'ruby',
            'js'
      end
    end

    describe "on post listing page" do
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
