class Promotion < ApplicationRecord
  TYPE = ["All Promo", "Dine In", "Take Away", "E-Payment"]
  TYPE_BE = ["Dine In", "Take Away", "E-Payment"]
  has_permalink :name, :update => true

  mount_uploader :image, PromotionImageUploader

  validates :name, presence: true

end
