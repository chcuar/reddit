class Sub < ApplicationRecord
  # Association
  # Validations
  has_many :topics, dependent: :destroy
end
