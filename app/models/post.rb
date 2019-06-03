class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :description, :code, :category_id
  validates :slug, uniqueness: true
  before_create :make_slug

  def to_param
    slug
  end

  def make_slug
    self.slug = self.description.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

end