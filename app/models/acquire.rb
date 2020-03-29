class Acquire < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
