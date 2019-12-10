class Category < ApplicationRecord
  has_permalink :name, :update => true

  has_many :products, dependent: :destroy

  validates :name, presence: true

  def self.default
    self.first.try(:permalink) || "none"
  end
end
