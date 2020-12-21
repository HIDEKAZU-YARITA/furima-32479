class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :preparation_day

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of range.' }
  end

  with_options numericality: { other_than: 0, message: 'must be selected.' } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
