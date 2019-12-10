class Product < ApplicationRecord
  has_permalink :name, :update => true

  has_many :product_images, inverse_of: :product
  has_many :products_sauces, dependent: :destroy
  has_many :sauces, through: :products_sauces

  belongs_to :category

  validates :name, presence: true

  accepts_nested_attributes_for :product_images, allow_destroy: true

  scope :best_sellers, -> { where(best_seller: true) }
  scope :favorites, -> { where(favorite: true) }

  def is_favorite?
    !!self.favorite
  end

  def is_best_seller?
    !!self.best_seller
  end

  def image(size)
    img = self.product_images.first
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return img.image.url(size.to_sym)
    end
  end
end
