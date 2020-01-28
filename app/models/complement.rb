class Complement < ApplicationRecord
  TYPE = ["Sambal", "Saus", "Additional"]
  has_many :products, through: :products_complements
  has_many :products_complements, dependent: :destroy

  mount_uploader :image, ComplementUploader

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
