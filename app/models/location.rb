class Location < ApplicationRecord
  has_permalink :name, :update => true

  has_many :location_images, inverse_of: :location

  validates :name, presence: true

  accepts_nested_attributes_for :location_images, allow_destroy: true

  def self.default
    self.first.try(:permalink) || "none"
  end
end
