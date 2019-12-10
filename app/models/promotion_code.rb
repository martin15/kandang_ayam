class PromotionCode < ApplicationRecord
  include Tokenable

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_must_greater_than_start_date

  def end_date_must_greater_than_start_date
    errors.add(:end_date, "must greater than start date") if start_date >= end_date
  end

end
