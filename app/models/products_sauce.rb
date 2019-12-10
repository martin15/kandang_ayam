class ProductsSauce < ApplicationRecord
  belongs_to :product
  belongs_to :sauce
end
