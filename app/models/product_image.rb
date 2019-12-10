class ProductImage < ApplicationRecord
  belongs_to  :product

  mount_uploader :image, ProductImageUploader

  validates :image, presence: true

  def get_image(size)
    img = self.image
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return self.image.url(size.to_sym)
    end
  end
end
