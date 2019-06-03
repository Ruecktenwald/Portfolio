class User < ApplicationRecord
  has_many :categories
  has_many :posts
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable     
  
  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :slug
  validates :slug, uniqueness: false
  before_create :make_slug


  def to_param
    slug
  end

  def make_slug
    self.slug = self.first_name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

end
