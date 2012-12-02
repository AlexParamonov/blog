require_relative 'action_framework'

# TODO load only Rails are used
class TestUser
  include Rails.application.routes.url_helpers
  include ActionFramework

  def initialize(action_framework)
    self.action_framework = action_framework
  end

  def act_as(role)
    self.extend class_eval(role.to_s)
  end

  def should_be_at(path)
    current_path.should == path
  end

  def visit_root
    visit '/'
  end

  module Post
    module Visitor
      def visit_listing_page
        visit posts_path
      end
    end

    module Admin
      def visit_edit_page(post)
        visit edit_admin_post_path(post)
      end

      def visit_show_page(post)
        visit admin_post_path(post)
      end

      def visit_listing_page
        visit admin_posts_path
      end

      def visit_new_page
        visit new_admin_post_path
      end
    end
  end
end
