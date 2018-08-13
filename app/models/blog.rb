class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :category_id

  belongs_to :category
  has_many :comments, dependent: :destroy

  # def self.special_blogs
  #   all
  # end
  #
  # def self.featured_blogs
  #   limit(2)
  # end

  def self.search(params)
    blog = Blog.where("body LIKE ? or title LIKE ?", "%#{params[:search]}%",
           "%#{params[:search]}%") if params[:search].present?


  end

  def self.recent
    order("created_at DESC")
  end
end
