module Admin
  class PostsController < ApplicationController
    http_basic_authenticate_with :name => ::CONFIG.admin.name, :password => ::CONFIG.admin.password if CONFIG.require_auth
    respond_to :html

    attr_reader :post
    helper_method :post

    before_filter :find_post, only: %w(show edit update destroy)
    before_filter :build_post, only: %w(new create)


    def index
      @posts = exhibit(Post.all)
      @posts = presenter_for @posts
    end

    def show; end
    def new; end
    def edit; end

    def create
      @extentions = extentions_for post

      post.publish!
      @extentions.process!

      redirect_to admin_posts_path, notice: t("post.message.published")
    rescue => exception
      # TODO handle extention errors in a view? or build them into presenter? raise exception?
      flash[:alert] = exception.message
      render 'new'
    end

    def update
      @extentions = extentions_for post

      post.update_attributes!(params[:post])
      @extentions.process!

      redirect_to admin_post_path(post), notice: t("post.message.updated")
    rescue => exception
      flash[:alert] = exception.message
      render action: "edit"
    end

    def destroy
      @extentions = extentions_for post

      post.destroy
      @extentions.process!

      redirect_to admin_posts_path, notice: t('post.message.deleted')
    rescue => exception
      flash[:alert] = exception.message
      render action: "edit"
    end

    private
    def build_post
      @post = exhibit feed.new_post(params.fetch :post, {})
      @post = presenter_for @post
    end

    def find_post
      @post = exhibit feed.post(params.fetch :id)
      @post = presenter_for @post
    end
  end
end
