class Category < ApplicationRecord
  enum status: { regular: 0, top_four: 1 }
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates_presence_of :name, :user_id, :status
  validates :name, :uniqueness => {:scope=>:user_id}
  before_save :uppercase_category
  validates :slug, uniqueness: true
  before_create :make_slug

  def uppercase_category
    self.name.capitalize!
  end

 

  def to_param
    slug
  end

  def make_slug
    self.slug = self.name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end
end
