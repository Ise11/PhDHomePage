class CategoriesController < ApplicationController
  before_action :set_sidebar_categories
  layout 'blog'

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @category.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @category.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  private

  def set_sidebar_categories
    @side_bar_categories = Category.with_blogs
  end
end
