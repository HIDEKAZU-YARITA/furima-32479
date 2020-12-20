class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :preparation_day

  has_one_attached :image
  belongs_to :user

  validates :image,              presence: true
  validates :name,               presence: true
  validates :introduction,       presence: true
  validates :category_id,        numericality: { other_than: 0, message: "must be selected." }
  validates :condition_id,       numericality: { other_than: 0, message: "must be selected." }
  validates :charge_id,          numericality: { other_than: 0, message: "must be selected." }
  validates :prefecture_id,      numericality: { other_than: 0, message: "must be selected." }
  validates :preparation_day_id, numericality: { other_than: 0, message: "must be selected." }
  validates :price,              presence: true,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid. 300 <= price <= 9,999,999" }

end
