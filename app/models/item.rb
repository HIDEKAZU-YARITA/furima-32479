class Item < ApplicationRecord

  validates :name,               presence: true
  validates :introduction,       presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :charge_id,          presence: true
  validates :prefecture_id,      presence: true
  validates :preparation_day_id, presence: true
  validates :price,              presence: true

end
