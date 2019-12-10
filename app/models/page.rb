class Page < ApplicationRecord
  has_permalink :title, :update => true

  validates :title, presence: true

end
