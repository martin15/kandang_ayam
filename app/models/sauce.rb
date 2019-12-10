class Sauce < ApplicationRecord
  TYPE = ["Sambal", "Saus"]
  has_many :products, through: :products_sauces
  has_many :products_sauces, dependent: :destroy

  mount_uploader :image, SauceUploader

  validates_presence_of :name
  validates_presence_of :image

  def get_image(size)
    img = self.image
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return self.image.url(size.to_sym)
    end
  end
end
