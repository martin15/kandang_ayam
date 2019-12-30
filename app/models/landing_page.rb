class LandingPage < ApplicationRecord
  has_permalink :title, :update => true

  mount_uploader :banner, LandingPageBannerUploader
  mount_uploader :video, LandingPageVideoUploader

  validates :title, presence: true
end
