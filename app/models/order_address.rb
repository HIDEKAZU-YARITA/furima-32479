class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'must be selected.' }
    validates :city
    validates :house_number
    validates :phone_number,  format: {with: /\A\d{10}$|^\d{11}\z/, message: "is invalid."}
    validates :token
  end

  def save
    @order = Order.create(item_id: item_id, user_id: user_id)
    Address.create( post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number,
                    building_name: building_name, phone_number: phone_number, order_id: @order.id)
  end
end
