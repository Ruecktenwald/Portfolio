class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :description, :code, :category_id


  private


end