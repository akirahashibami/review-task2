class Favoite < ApplicationRecord

  # 1対N
  belongs_to :user
  belongs_to :book
end
