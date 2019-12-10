class Banner < ApplicationRecord
  STATIC = ["mini-banner-1", "mini-banner-2", "mini-banner-3", "mini-banner-4", 
    "mini-banner-5", "mini-banner-6"]
  mount_uploader :image, BannerUploader

  validates_presence_of :image
end
