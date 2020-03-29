class Acquire < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validate do
    if item.stock < quantity
      errors.add(:base, '库存不足')
    end
  end
end
