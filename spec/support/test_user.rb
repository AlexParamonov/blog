require_relative 'action_framework'

# TODO load only Rails are used
class TestUser
  include Rails.application.routes.url_helpers
  include ActionFramework

  def act_as(role)
    self.extend class_eval(role.to_s)
  end

  def should_be_at(path)
    current_path.should == path
  end

  def visit_root
    visit '/'
  end

  module Visitor
    def visit_posts_listing
      visit_root
      click 'posts'
    end
  end

  module Admin
    def visit_edit_post_page_for(post)
      visit edit_admin_post_path(post)
    end

    def visit_admin_posts_listing
      visit admin_posts_path
      # click 'posts'
    end

    def visit_admin_new_post_page
      visit new_admin_post_path
    end
  end
end
