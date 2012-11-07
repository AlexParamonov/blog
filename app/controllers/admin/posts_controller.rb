module Admin
  class PostsController < ApplicationController
    http_basic_authenticate_with :name => ::CONFIG.admin.name, :password => ::CONFIG.admin.password if CONFIG.require_auth
    respond_to :html

    def index
      @posts = exhibit(Post.all)
    end

    def show
      @post = exhibit(feed.post(params[:id]))
    end

    def new
      @post = exhibit(feed.new_post)
    end

    def edit
      @post = exhibit(feed.post(params[:id]))
    end

    def create
      @post = exhibit(feed.new_post(params[:post]))

      Extentions.extentions_for(@post, self).process
      # TODO remove if-else, use callbacks
      if @post.publish
        redirect_to admin_posts_path, notice: t("post.message.published")
      else
        self.action_name = 'new'
        render 'new'
      end
    end

    def update
      @post = exhibit(feed.post(params[:id]))

      if @post.update_attributes(params[:post])
        redirect_to @post, notice: t('post.message.updated')
      else
        self.action_name = 'edit'
        render action: "edit"
      end
    end

    def destroy
      @post = feed.post(params[:id])
      @post.destroy

      if @post.destroy
        redirect_to admin_posts_path, notice: t('post.message.deleted')
      else
        self.action_name = 'edit'
        render action: "edit"
      end
    end
  end
end
