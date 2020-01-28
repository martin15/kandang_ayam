class ProductsComplement < ApplicationRecord
  belongs_to :product
  belongs_to :complement
end
