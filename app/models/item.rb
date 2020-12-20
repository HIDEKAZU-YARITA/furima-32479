class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :preparation_day

  has_one_attached :image
  belongs_to :user

  validates :name,               presence: true
  validates :introduction,       presence: true
  validates :category_id,        numericality: { other_than: 0 }
  validates :condition_id,       numericality: { other_than: 0 }
  validates :charge_id,          numericality: { other_than: 0 }
  validates :prefecture_id,      numericality: { other_than: 0 }
  validates :preparation_day_id, numericality: { other_than: 0 }
  validates :price,              presence: true

end
