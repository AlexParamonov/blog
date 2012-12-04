class PostsController < ApplicationController
  respond_to :html

  attr_reader :post
  helper_method :post

  before_filter :find_post, only: %w(show)


  def index
    @posts = feed.entries
  end

  def show; end

  private
  def find_post
    @post = exhibit feed.post(params.fetch :id)
    @post = presenter_for @post
  end
end
