class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :order

  with_options presence: true do
    validates :post_number
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'must be selected.' }

end
